// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart' hide Logger;
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import '../settings/settings.dart';
import 'songs.dart';
import 'sounds.dart';

/// Allows playing music and sound. A facade to `package:audioplayers`.
class AudioController {
  static final _log = Logger('AudioController');

  late AudioCache _musicCache;

  late AudioCache _sfxCache;

  final AudioPlayer _musicPlayer;

  /// This is a list of [AudioPlayer] instances which are rotated to play
  /// sound effects.
  ///
  /// Normally, we would just call [AudioCache.play] and let it procure its
  /// own [AudioPlayer] every time. But this seems to lead to errors and
  /// bad performance on iOS devices.
  final List<AudioPlayer> _sfxPlayers;

  int _currentSfxPlayer = 0;

  final Queue<Song> _playlist;

  final Random _random = Random();

  SettingsController? settings;

  ValueNotifier<AppLifecycleState>? _lifecycleNotifier;

  /// Creates an instance that plays music and sound.
  ///
  /// Use [polyphony] to configure the number of sound effects (SFX) that can
  /// play at the same time. A [polyphony] of `1` will always only play one
  /// sound (a new sound will stop the previous one). See discussion
  /// of [_sfxPlayers] to learn why this is the case.
  ///
  /// Background music does not count into the [polyphony] limit. Music will
  /// never be overridden by sound effects.
  AudioController({int polyphony = 2})
      : assert(polyphony >= 1),
        _musicPlayer = AudioPlayer(playerId: 'musicPlayer'),
        _sfxPlayers =
            Iterable.generate(polyphony, (i) => AudioPlayer(playerId: 'sfxPlayer#$i', mode: PlayerMode.LOW_LATENCY))
                .toList(growable: false),
        _playlist = Queue.of(List<Song>.of(songs)..shuffle()) {
    _musicCache = AudioCache(
      fixedPlayer: _musicPlayer,
      prefix: 'assets/music/',
    );
    _sfxCache = AudioCache(
      fixedPlayer: _sfxPlayers.first,
      prefix: 'assets/sfx/',
    );

    _musicPlayer.onPlayerCompletion.listen(_changeSong);
  }

  /// Enables the [AudioController] to listen to [AppLifecycleState] events,
  /// and therefore do things like stopping playback when the game
  /// goes into the background.
  void attachLifecycleNotifier(ValueNotifier<AppLifecycleState> lifecycleNotifier) {
    _lifecycleNotifier?.removeListener(_handleAppLifecycle);

    lifecycleNotifier.addListener(_handleAppLifecycle);
    _lifecycleNotifier = lifecycleNotifier;
  }

  /// Enables the [AudioController] to track changes to settings.
  /// Namely, when any of [SettingsController.soundMuted],
  /// [SettingsController.backgroundMusicOn] or [SettingsController.sfxOn] changes,
  /// the audio controller will act accordingly.
  void attachSettings(SettingsController settingsController) {
    if (settings == settingsController) {
      // Already attached to this instance. Nothing to do.
      return;
    }

    // Remove handlers from the old settings controller if present
    final oldSettings = settings;
    if (oldSettings != null) {
      oldSettings.soundMuted.removeListener(_mutedHandler);
      oldSettings.backgroundMusicOn.removeListener(_musicOnHandler);
      oldSettings.sfxOn.removeListener(_soundsOnHandler);
    }

    settings = settingsController;

    // Add handlers to the new settings controller
    settingsController.soundMuted.addListener(_mutedHandler);
    settingsController.backgroundMusicOn.addListener(_musicOnHandler);
    settingsController.sfxOn.addListener(_soundsOnHandler);

    if (!settingsController.soundMuted.value && settingsController.backgroundMusicOn.value) {
      _startMusic();
    }
  }

  void dispose() {
    _lifecycleNotifier?.removeListener(_handleAppLifecycle);
    _stopAllSound();
    _musicPlayer.dispose();
    for (final player in _sfxPlayers) {
      player.dispose();
    }
  }

  /// Preloads all sound effects.
  Future<void> initialize() async {
    _log.info('Preloading sound effects');
    // This assumes there is only a limited number of sound effects in the game.
    // If there are hundreds of long sound effect files, it's better
    // to be more selective when preloading.
    await _sfxCache.loadAll(SfxType.values.expand(soundTypeToFilename).toList());
  }

  /// Plays a single sound effect, defined by [type].
  ///
  /// The controller will ignore this call when the attached settings'
  /// [SettingsController.soundMuted] is `true` or if its
  /// [SettingsController.sfxOn] is `false`.
  void playSfx(SfxType type) {
    final muted = settings?.soundMuted.value ?? true;
    if (muted) {
      debugPrint('Ignoring playing sound ($type) because audio is muted.');
      _log.info(() => 'Ignoring playing sound ($type) because audio is muted.');
      return;
    }
    final soundsOn = settings?.sfxOn.value ?? false;
    if (!soundsOn) {
      debugPrint('Ignoring playing sound ($type) because sounds are turned off.');
      _log.info(() => 'Ignoring playing sound ($type) because sounds are turned off.');
      return;
    }

    playSfxNow(type);
  }

  /// Plays a single sound effect, defined by [type].
  ///
  /// The controller will ignore this call when the attached settings'
  /// [SettingsController.soundMuted] is `true` or if its
  /// [SettingsController.sfxOn] is `false`.
  void playSfxBackground(SfxType type) {
    final muted = settings?.soundMuted.value ?? true;
    if (muted) {
      debugPrint('Ignoring playing sound ($type) because audio is muted.');
      _log.info(() => 'Ignoring playing sound ($type) because audio is muted.');
      return;
    }
    final soundsOn = settings?.backgroundMusicOn.value ?? false;
    if (!soundsOn) {
      debugPrint('Ignoring playing sound ($type) because sounds are turned off.');
      _log.info(() => 'Ignoring playing sound ($type) because sounds are turned off.');
      return;
    }

    playSfxNow(type);
  }

  void playSfxNow(SfxType type) {
    // _log.info(() => 'Playing sound: $type');
    final options = soundTypeToFilename(type);
    final filename = options[_random.nextInt(options.length)];
    // _log.info(() => '- Chosen filename: $filename');
    _sfxCache.play(filename, volume: soundTypeToVolume(type));
    _currentSfxPlayer = (_currentSfxPlayer + 1) % _sfxPlayers.length;
    _sfxCache.fixedPlayer = _sfxPlayers[_currentSfxPlayer];
  }

  void _changeSong(void _) {
    _log.info('Last song finished playing.');
    // Put the song that just finished playing to the end of the playlist.
    _playlist.addLast(_playlist.removeFirst());
    // Play the next song.
    _log.info(() => 'Playing ${_playlist.first} now.');
    _startMusic();
  }

  void _handleAppLifecycle() {
    switch (_lifecycleNotifier!.value) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _stopAllSound();
        break;
      case AppLifecycleState.resumed:
        if (!settings!.soundMuted.value && settings!.backgroundMusicOn.value) {
          _resumeMusic();
        }
        break;
      case AppLifecycleState.inactive:
        // No need to react to this state change.
        break;
    }
  }

  void _musicOnHandler() {
    if (settings!.backgroundMusicOn.value) {
      // Music got turned on.
      if (!settings!.soundMuted.value) {
        _resumeMusic();
      }
    } else {
      // Music got turned off.
      _stopMusic();
    }
  }

  void _mutedHandler() {
    if (settings!.soundMuted.value) {
      // All sound just got muted.
      _stopAllSound();
    } else {
      // All sound just got un-muted.
      if (settings!.backgroundMusicOn.value) {
        _resumeMusic();
      }
    }
  }

  Future<void> _resumeMusic() async {
    _log.info('Resuming music');
    switch (_musicPlayer.state) {
      case PlayerState.PAUSED:
        _log.info('Calling _musicPlayer.resume()');
        try {
          await _musicPlayer.resume();
        } catch (e) {
          // Sometimes, resuming fails with an "Unexpected" error.
          _log.severe(e);
          await _startMusic();
        }
        break;
      case PlayerState.STOPPED:
        _log.info("resumeMusic() called when music is stopped. "
            "This probably means we haven't yet started the music. "
            "For example, the game was started with sound off.");
        await _startMusic();
        break;
      case PlayerState.PLAYING:
        _log.warning('resumeMusic() called when music is playing. '
            'Nothing to do.');
        break;
      case PlayerState.COMPLETED:
        _log.warning('resumeMusic() called when music is completed. '
            "Music should never be 'completed' as it's either not playing "
            "or looping forever.");
        await _startMusic();
        break;
    }
  }

  void _soundsOnHandler() {
    for (final player in _sfxPlayers) {
      if (player.state == PlayerState.PLAYING) {
        player.stop();
      }
    }
  }

  Future<void> _startMusic() async {
    _log.info('starting music');
    if (_playlist.isNotEmpty) {
      await _musicCache.play(_playlist.first.filename);
    }
  }

  void _stopAllSound() {
    if (_musicPlayer.state == PlayerState.PLAYING) {
      _musicPlayer.pause();
    }
    for (final player in _sfxPlayers) {
      player.stop();
    }
  }

  void _stopMusic() {
    _log.info('Stopping music');
    if (_musicPlayer.state == PlayerState.PLAYING) {
      _musicPlayer.pause();
    }
  }
}
