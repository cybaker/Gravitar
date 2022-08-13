import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/enemy_ship.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/reactor.dart';
import '../game/model/gravity.dart';
import '../game/player/player.dart';

var playerInvincible = PlayerProperties(bulletFireLifetimeSecs: 4, bulletReloadSecs: 0.1, invincible: true);
var playerEasy = PlayerProperties(bulletFireLifetimeSecs: 4, bulletReloadSecs: 0.1);
var playerNormal = PlayerProperties(thrust: 180, bulletFireLifetimeSecs: 3, bulletReloadSecs: 0.18);
var playerHard = PlayerProperties(thrust: 240, thrustConsumption: 2, bulletFireLifetimeSecs: 2.5, bulletReloadSecs: 0.25);
var playerInsane = PlayerProperties(thrust: 480, thrustConsumption: 1.5, bulletFireLifetimeSecs: 2.5, bulletReloadSecs: 0.25);

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
