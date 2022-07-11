// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'persistence/settings_persistence.dart';

/// An class that holds settings like [playerName] or [backgroundMusicOn],
/// and saves them to an injected persistence store.
class SettingsController {
  final SettingsPersistence _persistence;

  /// Whether or not the sound is on at all. This overrides both music
  /// and sound.
  ValueNotifier<bool> soundMuted = ValueNotifier(false);

  ValueNotifier<String> playerName = ValueNotifier('Player');

  ValueNotifier<bool> sfxOn = ValueNotifier(false);

  ValueNotifier<bool> backgroundMusicOn = ValueNotifier(false);

  /// Creates a new instance of [SettingsController] backed by [persistence].
  SettingsController({required SettingsPersistence persistence})
      : _persistence = persistence;

  /// Asynchronously loads values from the injected persistence store.
  Future<void> loadStateFromPersistence() async {
    await Future.wait([
      _persistence
          .getMuted(defaultValue: false)
          .then((value) => soundMuted.value = value),
      _persistence.getSoundsOn().then((value) => sfxOn.value = value),
      _persistence.getMusicOn().then((value) => backgroundMusicOn.value = value),
      _persistence.getPlayerName().then((value) => playerName.value = value),
    ]);
  }

  void setPlayerName(String name) {
    playerName.value = name;
    _persistence.savePlayerName(playerName.value);
  }

  void toggleMusicOn() {
    backgroundMusicOn.value = !backgroundMusicOn.value;
    _persistence.saveMusicOn(backgroundMusicOn.value);
  }

  void toggleMuted() {
    soundMuted.value = !soundMuted.value;
    _persistence.saveMuted(soundMuted.value);
  }

  void toggleSoundsOn() {
    sfxOn.value = !sfxOn.value;
    _persistence.saveSoundsOn(sfxOn.value);
  }
}
