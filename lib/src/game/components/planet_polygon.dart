import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import '../extensions/component_effects.dart';
import '../player_game.dart';

/// A polygon ground element in a Planet, like a triangle or complex polygon
class PlanetPolygon extends PolygonComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  final List<Vector2> verticesList;

  var flicker;

  PlanetPolygon({priority = 2, required this.offset, required this.verticesList, this.flicker = false})
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
    if(flicker) _paintTimerTick(dt);
  }

  double fireTimeout = 0;

  _paintTimerTick(double dt) {
    fireTimeout -= dt;
    if(fireTimeout <= 0) {
      debugPrint("Painting off");
      fireTimeout = this.randomFromTo(1, 5);
      paint = paintOff;
    } else if (fireTimeout < 0.04) {
      debugPrint("Painting on");
      paint = paintOn;
    }
  }
}
