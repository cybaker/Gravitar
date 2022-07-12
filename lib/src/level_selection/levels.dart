// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flame/game.dart';

import 'planet1.dart';
import 'planet2.dart';
import 'planet3.dart';
import 'planet4.dart';
import 'planet5.dart';
import 'planet6.dart';
import 'planet7.dart';
import 'planet8.dart';
import 'planet9.dart';
import 'planet10.dart';
import 'planet11.dart';
import 'reactor.dart';

import '../game/components/fuel_depot.dart';
import '../game/components/base_enemy.dart';
import '../game/components/enemy_ship.dart';
import '../game/model/gravity.dart';
import '../game/model/star_system.dart';
import '../game/player/player.dart';

var playerDefault = PlayerProperties();
var playerEasy = PlayerProperties(playerBulletFireLifetimeSecs: 3, playerBulletReloadSecs: 0.1);

var basicEnemyBaseProperties = EnemyBaseProperties(
  averageFireTimeSec: 0.5,
);
var easyEnemyBaseProperties = EnemyBaseProperties(
  averageFireTimeSec: 1.0,
);

var basicEnemyShipProperties = EnemyShipProperties(
  enemyShipAverageSpawnTimeSec: 10,
  enemyShipPathChangeIntervalSec: 5,
  enemyShipSpeed: 20,
);

var fuelDepotPropertiesEasy = FuelDepotProperties(fuelIncreasePerDepot: 2500);
var fuelDepotPropertiesNormal = FuelDepotProperties(fuelIncreasePerDepot: 1000);

var downGravity = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: 0.4);
var downGravityEasy = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: 0.1);

/// Starts at upper left, 1000 Wide by 750 Height
var planetCenterGravity = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.4);
var planetCenterGravityEasy = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.1);

var starSystemCenterGravity = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.4);
var starSystemCenterGravityEasy = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.1);

StarSystem starSystemNormal = StarSystem(
  gravity: starSystemCenterGravity,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet1,
    planet2,
    planet3,
    planet4,
    planet5,
    planet6,
    planet7,
    planet8,
    planet9,
    planet10,
    planet11,
    reactor
  ],
  playerProperties: playerDefault,
  basicEnemyProperties: basicEnemyBaseProperties,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesNormal,
);

StarSystem starSystemEasyEasy = StarSystem(
  gravity: starSystemCenterGravityEasy,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet2Easy,
    planet8Easy,
    planet9Easy,
    planet10Easy,
  ],
  playerProperties: playerEasy,
  basicEnemyProperties: easyEnemyBaseProperties,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
);

StarSystem starSystemEasyNormal = StarSystem(
  gravity: starSystemCenterGravityEasy,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet1Easy,
    planet3Easy,
    planet4Easy,
    planet5Easy,
    planet6Easy,
  ],
  playerProperties: playerEasy,
  basicEnemyProperties: easyEnemyBaseProperties,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
);

StarSystem starSystemEasyChallenge = StarSystem(
  gravity: starSystemCenterGravityEasy,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet7Easy,
    planet11Easy,
    reactorEasy
  ],
  playerProperties: playerEasy,
  basicEnemyProperties: easyEnemyBaseProperties,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
);


var gameLevels = [
  GameUniverse(
    level: 1,
    name: 'Beginner - training',
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
    difficulty: 2,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 10000,

    starSystems: [starSystemEasyNormal],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 3,
    name: 'Beginner - harder',
    difficulty: 3,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 10000,

    starSystems: [starSystemEasyChallenge],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 4,
    name: 'Ensign - easy',
    difficulty: 3,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 10000,

    starSystems: [starSystemNormal],

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
