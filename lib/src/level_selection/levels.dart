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
var upGravityNormal = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: -0.3);
var upGravityEasy = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: -0.1);
var upGravityHard = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: -0.7);
var upGravityInsane = Gravity(gravityCenter: Vector2(500, 100000), gravityAmount: -1.2);

var centerGravityEasy = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.1);
var centerGravityNormal = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.3);
var centerGravityHard = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 0.7);
var centerGravityInsane = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: 1.2);
var centerGravityEasyReverse = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: -0.1);
var centerGravityNormalReverse = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: -0.3);
var centerGravityHardReverse = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: -0.7);
var centerGravityInsaneReverse = Gravity(gravityCenter: Vector2(500, 650), gravityAmount: -1.2);

var starSystemCenterGravityEasy = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.1);
var starSystemCenterGravityNormal = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.3);
var starSystemCenterGravityHard = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 0.7);
var starSystemCenterGravityInsane = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: 1.2);

var starSystemCenterGravityEasyReverse = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: -0.1);
var starSystemCenterGravityNormalReverse = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: -0.3);
var starSystemCenterGravityHardReverse = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: -0.7);
var starSystemCenterGravityInsaneReverse = Gravity(gravityCenter: Vector2(500, 500), gravityAmount: -1.2);

var reactorPropertiesEasy = ReactorProperties();

var _starSystemEasyPlanetsReverse = [
  planet1EasyReverse,
  planet2EasyReverse,
  planet3EasyReverse,
  planet4EasyReverse,
  planet5EasyReverse,
  planet6EasyReverse,
  planet7EasyReverse,
  planet8EasyReverse,
  planet9EasyReverse,
  planet10EasyReverse,
  planet11EasyReverse,
  reactorEasyReverse
];

var _starSystemNormalPlanets = [
  planet1Normal,
  planet2Normal,
  planet3Normal,
  planet4Normal,
  planet5Normal,
  planet6Normal,
  planet7Normal,
  planet8Normal,
  planet9Normal,
  planet10Normal,
  planet11Normal,
  reactorNormal
];

var _starSystemNormalPlanetsReverse = [
  planet1NormalReverse,
  planet2NormalReverse,
  planet3NormalReverse,
  planet4NormalReverse,
  planet5NormalReverse,
  planet6NormalReverse,
  planet7NormalReverse,
  planet8NormalReverse,
  planet9NormalReverse,
  planet10NormalReverse,
  planet11NormalReverse,
  reactorNormalReverse
];

var _starSystemHardPlanets = [
  planet1Hard,
  planet2Hard,
  planet3Hard,
  planet4Hard,
  planet5Hard,
  planet6Hard,
  planet7Hard,
  planet8Hard,
  planet9Hard,
  planet10Hard,
  planet11Hard,
  reactorHard
];

var _starSystemHardPlanetsReverse = [
  planet1HardReverse,
  planet2HardReverse,
  planet3HardReverse,
  planet4HardReverse,
  planet5HardReverse,
  planet6HardReverse,
  planet7HardReverse,
  planet8HardReverse,
  planet9HardReverse,
  planet10HardReverse,
  planet11HardReverse,
  reactorHardReverse
];

var _starSystemInsanePlanets = [
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
];

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

StarSystem starSystemEasyReverseGravity = StarSystem(
  gravity: starSystemCenterGravityEasyReverse,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemEasyPlanetsReverse,
  playerProperties: playerEasy,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemNormal = StarSystem(
  gravity: starSystemCenterGravityNormal,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemNormalPlanets,
  playerProperties: playerNormal,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemNormalReverse = StarSystem(
  gravity: starSystemCenterGravityNormalReverse,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemNormalPlanetsReverse,
  playerProperties: playerNormal,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemHard = StarSystem(
  gravity: starSystemCenterGravityHard,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemHardPlanets,
  playerProperties: playerHard,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
);

StarSystem starSystemHardReverse = StarSystem(
  gravity: starSystemCenterGravityHardReverse,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemHardPlanetsReverse,
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
  planets: _starSystemInsanePlanets,
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
    name: 'Beginner - reverse gravity',
    difficulty: 4,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 2000,

    starSystems: [starSystemEasyReverseGravity],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 5,
    name: 'Ensign',
    difficulty: 5,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormal],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 6,
    name: 'Ensign - reverse gravity',
    difficulty: 6,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 4000,

    starSystems: [starSystemNormalReverse],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 7,
    name: 'Commander',
    difficulty: 7,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHard],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 8,
    name: 'Commander - reverse gravity',
    difficulty: 8,
    cameraZoomedInDimension: 500,
    playfieldDimension: 1000,
    extraLifeThreshold: 5000,

    starSystems: [starSystemHardReverse],

    // TODO: When ready, change these achievement IDs.
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameUniverse(
    level: 9,
    name: 'Admiral - insane',
    difficulty: 9,
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
