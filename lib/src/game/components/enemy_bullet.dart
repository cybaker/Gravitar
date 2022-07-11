import 'dart:ui';

import 'package:Gravitar/src/game/player/player_shield.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player/player.dart';
import '../player_game.dart';
import 'explosion.dart';
import 'planet_polygon.dart';

class EnemyBullet extends CircleComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  EnemyBullet({
    priority = 4,
    required double radius,
    required this.velocityVector,
    required this.initialPosition,
    required this.timeToLive,
  }) : super(radius: radius);

  final Vector2 velocityVector;
  final Vector2 initialPosition;
  late double timeToLive;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = BasicPalette.red.paint()..style = PaintingStyle.fill;
    position = initialPosition;
    await add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is PlanetPolygon) explode();
    if (other is Player) hitPlayer(other);
    if (other is PlayerShield) gameRef.remove(this);
    super.onCollision(points, other);
  }

  hitPlayer(Player player) {
    player.damageShip();
    explode();
  }

  explode() {
    gameRef.remove(this);
    gameRef.add(bulletExplosion(this.position));
  }

  @override
  void update(double deltaTime) {
    super.update(deltaTime);

    position = position + velocityVector * deltaTime;

    updateTimeToLive(deltaTime);
  }

  void updateTimeToLive(double deltaTime) {
    timeToLive -= deltaTime;
    if (timeToLive < 0.0) {
      gameRef.remove(this);
    }
  }
}
