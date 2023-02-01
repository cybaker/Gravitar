import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player/player.dart';
import '../player_game.dart';

class ExpandingCircle extends CircleComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  ExpandingCircle({
    priority = 4,
    required this.expandSpeed,
    required this.initialPosition,
    required this.secondsToLive,
  }) : super(radius: 1, position: initialPosition);

  final double expandSpeed;
  final Vector2 initialPosition;
  late double secondsToLive;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;
    paint = BasicPalette.blue.withAlpha(128).paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeSize;
    await add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is Player) hitPlayer(other);
    super.onCollision(points, other);
  }

  hitPlayer(Player player) {
    player.pushAwayFrom(position, 100/5 * secondsToLive);
  }

  @override
  void update(double deltaTime) {
    super.update(deltaTime);

    radius = radius + expandSpeed;
    paint.strokeWidth = strokeSize;

    updateTimeToLive(deltaTime);
  }

  double get strokeSize => secondsToLive * 3;

  void updateTimeToLive(double deltaTime) {
    secondsToLive -= deltaTime;
    if (secondsToLive < 0.0) {
      gameRef.remove(this);
    }
  }
}
