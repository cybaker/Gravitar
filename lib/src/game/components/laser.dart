import 'dart:ui';

import 'package:Gravitar/src/game/components/planet_polygon.dart';
import 'package:Gravitar/src/game/components/reactor.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player_game.dart';
import 'base_enemy.dart';
import 'explosion.dart';

class Laser extends RectangleComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  Laser({
    priority = 4,
    required this.angle,
    required this.initialPosition,
    this.timeToLive = 0.01,
  }) : super(position: initialPosition, size: Vector2(200, 1), angle: angle);

  final double angle;
  final Vector2 initialPosition;
  late double timeToLive;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = BasicPalette.green.paint()..style = PaintingStyle.fill;
    position = initialPosition;
    await add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is EnemyBaseComponent) hitEnemy(other);
    if (other is ReactorComponent) gameRef.remove(this);
    if (other is PlanetPolygon) explode(points);
    super.onCollision(points, other);
  }

  explode(Set<Vector2> points) {
    gameRef.remove(this);
    gameRef.add(bulletExplosion(points.first));
  }

  hitEnemy(EnemyBaseComponent enemy) {
    enemy.damage();
    gameRef.remove(this);
  }

  @override
  void update(double deltaTime) {
    super.update(deltaTime);

    updateTimeToLive(deltaTime);
  }

  void updateTimeToLive(double deltaTime) {
    timeToLive -= deltaTime;
    if (timeToLive < 0) {
      gameRef.remove(this);
    }
  }
}
