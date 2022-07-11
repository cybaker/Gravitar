import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../player_game.dart';

class PlayerThrust extends PolygonComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  PlayerThrust({
    priority = 1,
  }) : super(
          [
            Vector2(0.0, 0.0),
            Vector2(2.0, 2.0),
            Vector2(0.0, 8.0),
            Vector2(-2.0, 2.0),
          ],
          position: Vector2(2.5, 8),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
  }
}
