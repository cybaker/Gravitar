
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

List<Vector2> _topPlanetExitShape = [
  Vector2(0, 0),
  Vector2(1000, 0),
  Vector2(1000, -5),
  Vector2(0, -5),
];

class PlanetExitComponent  extends PolygonComponent with CollisionCallbacks {

  PlanetExitComponent({required this.points})
      : super(points,);

  final List<Vector2> points;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.topLeft;
    paint = BasicPalette.blue.withAlpha(0).paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    await add(PolygonHitbox(vertices));
  }
}


class TopPlanetExitComponent  extends PlanetExitComponent {
  TopPlanetExitComponent() : super(points: _topPlanetExitShape,);
}

List<Vector2> _surroundPlanetExitShape = [
  Vector2(0, 0),
  Vector2(1200, 0),
  Vector2(1200, 1200),
  Vector2(0, 1200),
];

class SurroundPlanetExitComponent  extends PlanetExitComponent {

  SurroundPlanetExitComponent()
      : super(points: _surroundPlanetExitShape,);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(-100, -100);
    paint = BasicPalette.blue.withAlpha(80).paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
  }
}
