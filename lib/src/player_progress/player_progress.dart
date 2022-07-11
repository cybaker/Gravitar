// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'persistence/player_progress_persistence.dart';

/// Encapsulates the player's progress.
class PlayerProgress extends ChangeNotifier {
  static const maxHighestScoresPerPlayer = 10;

  final PlayerProgressPersistence _store;

  int _highestLevelReached = 0;
  double _highestScoreReached = 0;

  /// Creates an instance of [PlayerProgress] backed by an injected
  /// persistence [store].
  PlayerProgress(PlayerProgressPersistence store) : _store = store;

  /// The highest level that the player has reached so far.
  int get highestLevelReached => _highestLevelReached;

  /// The highest score that the player has reached so far.
  double get highestScoreReached => _highestScoreReached;

  /// Fetches the latest data from the backing persistence store.
  Future<void> getHighestLevelFromStore() async {
    final level = await _store.getHighestLevelReached();
    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();
    } else if (level < _highestLevelReached) {
      await _store.saveHighestLevelReached(_highestLevelReached);
    }
  }

  /// Fetches the latest data from the backing persistence store.
  Future<void> getHighestScoreFromStore() async {
    final score = await _store.getTotalScore();
    if (score > _highestScoreReached) {
      _highestScoreReached = score;
      notifyListeners();
    } else if (score < _highestScoreReached) {
      await _store.saveTotalScore(_highestScoreReached);
    }
  }

  /// Resets the player's progress so it's like if they just started
  /// playing the game for the first time.
  void reset() {
    _highestLevelReached = 0;
    notifyListeners();
    _store.saveHighestLevelReached(_highestLevelReached);
  }

  /// Registers [level] as reached.
  ///
  /// If this is higher than [highestLevelReached], it will update that
  /// value and save it to the injected persistence store.
  void setLevelReached(int level) {
    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();

      unawaited(_store.saveHighestLevelReached(level));
    }
  }

  /// Registers [playerGame] as reached.
  ///
  /// If this is higher than [highestLevelReached], it will update that
  /// value and save it to the injected persistence store.
  void setTotalScoreReached(double score) {
    if (score > _highestScoreReached) {
      _highestScoreReached = score;
      notifyListeners();

      unawaited(_store.saveTotalScore(score));
    }
  }

  Future<double> getTotalScore() async {
    return await _store.getTotalScore();
  }
}
