import 'dart:ui';

import 'package:Gravitar/src/game/components/planet_polygon.dart';
import 'package:Gravitar/src/game/components/reactor.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player_game.dart';
import 'base_enemy.dart';
import 'explosion.dart';

class Bullet extends CircleComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  Bullet({
    priority: 4,
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
    paint = BasicPalette.green.paint()..style = PaintingStyle.fill;
    position = initialPosition;
    await add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is EnemyBaseComponent) hitEnemy(other);
    if (other is ReactorComponent) gameRef.remove(this);
    if (other is PlanetPolygon) explode();
    super.onCollision(points, other);
  }

  explode() {
    gameRef.remove(this);
    gameRef.add(bulletExplosion(this.position));
  }

  hitEnemy(EnemyBaseComponent enemy) {
    enemy.damage();
    gameRef.remove(this);
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
