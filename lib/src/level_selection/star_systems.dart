import 'package:flame/components.dart';

import '../game/model/star_system.dart';
import 'level_properties.dart';
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


var _starSystemEasyPlanets = [
  planet1Easy,
  planet2Easy,
  planet3Easy,
  planet4Easy,
  planet5Easy,
  planet6Easy,
  planet7Easy,
  planet8Easy,
  planet9Easy,
  planet10Easy,
  planet11Easy,
  reactorEasy
];

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
    // planet8Easy,
    // planet9Easy,
    // planet10Easy,
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
    // planet3Easy,
    // planet4Easy,
    // planet5Easy,
    // planet6Easy,
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
  planets: [planet7Easy,],
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

StarSystem starSystemEasyFlicker = StarSystem(
  gravity: starSystemCenterGravityEasy,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemEasyPlanets,
  playerProperties: playerEasy,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
  planetFlicker: true,
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

StarSystem starSystemNormalFlicker = StarSystem(
  gravity: starSystemCenterGravityNormal,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemNormalPlanets,
  playerProperties: playerNormal,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
  planetFlicker: true,
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

StarSystem starSystemHardFlicker = StarSystem(
  gravity: starSystemCenterGravityHard,
  startWarpInPosition: Vector2(500, 50),
  starImageFilename: 'star_image.jpeg',
  planets: _starSystemHardPlanets,
  playerProperties: playerHard,
  basicEnemyProperties: enemyBasePropertiesEasy,
  shipEnemyProperties: basicEnemyShipProperties,
  fuelDepotProperties: fuelDepotPropertiesEasy,
  reactorProperties: reactorPropertiesEasy,
  planetFlicker: true,
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
