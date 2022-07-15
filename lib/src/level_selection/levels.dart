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

import '../game/components/reactor.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/base_enemy.dart';
import '../game/components/enemy_ship.dart';
import '../game/model/gravity.dart';
import '../game/model/star_system.dart';
import '../game/player/player.dart';

var playerEasy = PlayerProperties(bulletFireLifetimeSecs: 4, bulletReloadSecs: 0.1);
var playerNormal = PlayerProperties(thrust: 3, bulletFireLifetimeSecs: 3, bulletReloadSecs: 0.18);
var playerHard = PlayerProperties(thrust: 4, thrustConsumption: 2, bulletFireLifetimeSecs: 2.5, bulletReloadSecs: 0.25);
var playerInsane = PlayerProperties(thrust: 8, thrustConsumption: 1.5, bulletFireLifetimeSecs: 2.5, bulletReloadSecs: 0.25);

var enemyBasePropertiesEasy = EnemyBaseProperties(averageFireTimeSec: 1.0,);
var enemyBasePropertiesNormal = EnemyBaseProperties(averageFireTimeSec: 0.5,);
var enemyBasePropertiesHard = EnemyBaseProperties(averageFireTimeSec: 0.4,);
var enemyBasePropertiesInsane = EnemyBaseProperties(averageFireTimeSec: 0.2,);

var basicEnemyShipProperties = EnemyShipProperties(
  enemyShipAverageSpawnTimeSec: 10,
  enemyShipPathChangeIntervalSec: 5,
  enemyShipSpeed: 20,
);

var fuelDepotPropertiesEasy = FuelDepotProperties(fuelIncreasePerDepot: 2000);
var fuelDepotPropertiesNormal = FuelDepotProperties(fuelIncreasePerDepot: 3000);
var fuelDepotPropertiesHard = FuelDepotProperties(fuelIncreasePerDepot: 4000);
var fuelDepotPropertiesInsane = FuelDepotProperties(fuelIncreasePerDepot: 5000);

var downGravityNormal = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: 0.3);
var downGravityEasy = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: 0.1);
var downGravityHard = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: 0.7);
var downGravityInsane = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: 1.2);

/// Starts at upper left, 1000 Wide by 750 Height
var planetCenterGravityNormal = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.3);
var planetCenterGravityEasy = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.1);
var planetCenterGravityHard = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.7);
var planetCenterGravityInsane = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 1.2);

var starSystemCenterGravityNormal = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.3);
var starSystemCenterGravityEasy = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.1);
var starSystemCenterGravityHard = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.7);
var starSystemCenterGravityInsane = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 1.2);

var reactorPropertiesEasy = ReactorProperties();

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
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
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
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemEasyChallenge = StarSystem(
  gravity: starSystemCenterGravityEasy,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [planet7Easy, planet11Easy, reactorEasy],
  playerProperties: playerEasy,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemNormalEasy = StarSystem(
  gravity: starSystemCenterGravityNormal,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet2,
    planet8,
    planet9,
    planet10,
  ],
  playerProperties: playerNormal,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemNormalNormal = StarSystem(
  gravity: starSystemCenterGravityNormal,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet1,
    planet3,
    planet4,
    planet5,
    planet6,
  ],
  playerProperties: playerNormal,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemNormalChallenge = StarSystem(
  gravity: starSystemCenterGravityNormal,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [planet7, planet11, reactor],
  playerProperties: playerNormal,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemHardEasy = StarSystem(
  gravity: starSystemCenterGravityHard,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet2Hard,
    planet8Hard,
    planet9Hard,
    planet10Hard,
  ],
  playerProperties: playerHard,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemHardNormal = StarSystem(
  gravity: starSystemCenterGravityHard,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet1Hard,
    planet3Hard,
    planet4Hard,
    planet5Hard,
    planet6Hard,
  ],
  playerProperties: playerHard,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemHardChallenge = StarSystem(
  gravity: starSystemCenterGravityHard,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [planet7Hard, planet11Hard, reactorHard],
  playerProperties: playerHard,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemInsane = StarSystem(
  gravity: starSystemCenterGravityInsane,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: [
    planet1Insane,
    planet2Insane,
    planet3Insane,
    planet4Insane,
    planet5Insane,
    planet6Insane,
    planet7Insane,
    planet8Insane,
    planet9Insane,
    planet10Insane,
    planet11Insane,
    reactorInsane
  ],
  playerProperties: playerInsane,
  basicEnemyProperties: enemyBasePropertiesInsane,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesInsane,
  reactorProperties: reactorPropertiesEasy,
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
    extraLifeThreshold: 2000,

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
    extraLifeThreshold: 2000,

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
    difficulty: 4,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormalEasy],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 5,
    name: 'Ensign - normal',
    difficulty: 5,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormalNormal],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 6,
    name: 'Ensign - harder',
    difficulty: 6,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormalChallenge],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 7,
    name: 'Commander - easy',
    difficulty: 7,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHardEasy],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 8,
    name: 'Commander - normal',
    difficulty: 8,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHardNormal],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 9,
    name: 'Commander - hard',
    difficulty: 9,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHardChallenge],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 10,
    name: 'Admiral - insane',
    difficulty: 100,
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
