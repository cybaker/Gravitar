import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import '../extensions/component_effects.dart';
import '../player_game.dart';

/// A polygon ground element in a Planet, like a triangle or complex polygon
class PlanetPolygon extends PolygonComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  final List<Vector2> verticesList;

  double flickerSeconds;

  PlanetPolygon({priority = 2, required this.offset, required this.verticesList, this.flickerSeconds = 0.0})
      : super(verticesList, position: offset);

  final Vector2 offset;

  final paintOn = BasicPalette.green.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  final paintOff = BasicPalette.green.withAlpha(0).paint();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = paintOn;
    await add(PolygonHitbox(vertices));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(flickerSeconds > 0.0) _paintTimerTick(dt);
  }

  double paintTimeout = 0;

  _paintTimerTick(double dt) {
    paintTimeout -= dt;
    if(paintTimeout <= 0) {
      // debugPrint("Painting off");
      paintTimeout = this.randomFromTo(1, 5);
      paint = paintOff;
    } else if (paintTimeout < flickerSeconds) {
      // debugPrint("Painting on");
      paint = paintOn;
    }
  }
}
