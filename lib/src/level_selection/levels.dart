// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../game/model/star_system.dart';
import 'star_systems.dart';

var gameUniverses = [
  GameUniverse(
    level: 1,
    name: 'Beginner - invincible!',
    difficulty: 1,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 2000,

    starSystems: [starSystemEasyEasy],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 2,
    name: 'Beginner - normal',
    difficulty: 1,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 2000,

    starSystems: [starSystemEasyNormal],
  ),
  GameUniverse(
    level: 3,
    name: 'Beginner - harder',
    difficulty: 1,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 2000,

    starSystems: [starSystemEasyChallenge],
  ),
  GameUniverse(
    level: 4,
    name: 'Beginner - reverse gravity',
    difficulty: 1,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 2000,

    starSystems: [starSystemEasyReverseGravity],
  ),
  GameUniverse(
    level: 5,
    name: 'Beginner - stealthy enemy',
    difficulty: 1,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 2000,

    starSystems: [starSystemEasyFlicker],
  ),
  GameUniverse(
    level: 6,
    name: 'Ensign',
    difficulty: 2,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormal],
  ),
  GameUniverse(
    level: 7,
    name: 'Ensign - reverse gravity',
    difficulty: 2,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormalReverse],
  ),
  GameUniverse(
    level: 8,
    name: 'Ensign - stealthy enemy',
    difficulty: 2,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormalFlicker],
  ),
  GameUniverse(
    level: 9,
    name: 'Commander',
    difficulty: 3,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHard],
  ),
  GameUniverse(
    level: 10,
    name: 'Commander - reverse gravity',
    difficulty: 3,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHardReverse],
  ),
  GameUniverse(
    level: 11,
    name: 'Commander - stealthy enemy',
    difficulty: 3,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHardFlicker],
  ),
  GameUniverse(
    level: 12,
    name: 'Admiral - insane',
    difficulty: 3,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemInsane],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
];

class GameUniverse {
  final int level;
  final String name;
  final int difficulty;
  final int cameraZoomedInDimension;
  final int playfieldDimension;
  final int extraLifeThreshold;

  final List<StarSystem> starSystems;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  bool get awardsAchievement => achievementIdAndroid != null;

  GameUniverse({
    required this.level,
    required this.name,
    required this.difficulty,
    required this.cameraZoomedInDimension,
    required this.playfieldDimension,
    required this.extraLifeThreshold,
    required this.starSystems,
    this.achievementIdIOS,
    this.achievementIdAndroid,
  }) : assert(
            (achievementIdAndroid != null && achievementIdIOS != null) ||
                (achievementIdAndroid == null && achievementIdIOS == null),
            'Either both iOS and Android achievement ID must be provided, '
            'or none');
}
