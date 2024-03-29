import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player_game.dart';

class PlayerShield extends CircleComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  PlayerShield({priority = 3, required double radius, required Vector2 position})
      : super(radius: radius, position: position);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = BasicPalette.blue.withAlpha(0x80).paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    var hitbox = CircleHitbox.relative(1, parentSize: this.size);
    hitbox.isSolid = true;
    await add(hitbox);
  }
}
