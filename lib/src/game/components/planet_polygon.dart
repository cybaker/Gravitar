import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player_game.dart';

/// A polygon ground element in a Planet, like a triangle or complex polygon
class PlanetPolygon extends PolygonComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  final List<Vector2> verticesList;

  PlanetPolygon({priority: 2, required this.offset, required this.verticesList})
      : super(verticesList, position: offset);

  final Vector2 offset;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = BasicPalette.green.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    await add(PolygonHitbox(vertices));
  }
}
