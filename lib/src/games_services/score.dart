// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

import '../game/player_game.dart';

/// Encapsulates a score and the arithmetic to compute it.
@immutable
class Score {
  final int score;

  final Duration duration;

  final int level;

  factory Score(PlayerGame game, Duration duration) {
    // The higher the difficulty, the higher the score.
    var score = game.gameState.score.value;

    // time bonus, enemies destroyed, fuel collected, planets cleared, reactors destroyed, lives gained

    // The lower the time to beat the level, the higher the score.
    score *= 10000 ~/ (duration.inSeconds.abs() + 1);

    // More remaining fuel, more score
    score += game.gameState.remainingFuel.value;

    // More remaining lives, more score
    score += 1000 * game.gameState.remainingLives.value;

    return Score._(score.toInt(), duration, game.universe.level);
  }

  const Score._(this.score, this.duration, this.level);

  String get formattedTime {
    final buf = StringBuffer();
    if (duration.inHours > 0) {
      buf.write('${duration.inHours}');
      buf.write(':');
    }
    final minutes = duration.inMinutes % Duration.minutesPerHour;
    if (minutes > 9) {
      buf.write('$minutes');
    } else {
      buf.write('0');
      buf.write('$minutes');
    }
    buf.write(':');
    buf.write((duration.inSeconds % Duration.secondsPerMinute)
        .toString()
        .padLeft(2, '0'));
    return buf.toString();
  }

  @override
  String toString() => 'Score<$score,$formattedTime,$level>';
}
