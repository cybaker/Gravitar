import 'dart:math';

import 'package:flame/components.dart';

import 'base_enemy.dart';
import '../player/player.dart';


class EnemyShipProperties {
  EnemyShipProperties({
    required this.enemyShipAverageSpawnTimeSec,
    required this.enemyShipPathChangeIntervalSec,
    required this.enemyShipSpeed,
  });

  final double enemyShipAverageSpawnTimeSec;
  final double enemyShipPathChangeIntervalSec;
  final double enemyShipSpeed;
}

class EnemyShip extends EnemyBaseComponent {
  EnemyShip({required this.player})
      : super();

  final Player player;

  double moveTimeoutSetting = 0;
  double moveTimeout = 0;
  Vector2 moveVector = Vector2(0, 0);

  late double playerAngle;

  @override
  void update(double dt) {
    super.update(dt);
    playerAngle = angleToPlayer;
    pointAtPlayer();
    move(dt);
  }

  void pointAtPlayer() {
    angle = -playerAngle + pi;
  }

  void move(double dt) {
    moveTimeout -= dt;
    if (_canChangeDirection) {
      moveVector = vectorAtAngle(playerAngle, gameRef.gameState.currentStarSystem.shipEnemyProperties.enemyShipSpeed);
      moveTimeout = moveTimeout;
    }
    position = position + moveVector * dt;
  }

  void setupEnemyVariables() {
    moveTimeoutSetting = gameRef.gameState.currentStarSystem.shipEnemyProperties.enemyShipPathChangeIntervalSec;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.damageShip();
    }
    super.onCollision(intersectionPoints, other);
  }

  bool get _canChangeDirection => moveTimeout <= 0;
}
