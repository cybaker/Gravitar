
import 'dart:ui';

import 'package:Gravitar/src/audio/sounds.dart';
import 'package:Gravitar/src/game/components/segment_component.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../player/player_shield.dart';

class FuelDepotProperties {
  FuelDepotProperties({
    this.fuelIncreasePerDepot = 2500,
    this.pointsPerDepot = 0,
  });

  final double fuelIncreasePerDepot;
  final double pointsPerDepot;
}

List<Vector2> _fuelDepotShape = [
  Vector2(5, 0),
  Vector2(5, 10),
  Vector2(-5, 10),
  Vector2(-5, 0),
];

class FuelDepotComponent  extends SegmentComponent with CollisionCallbacks {

  late var fuelRemaining = gameRef.gameState.currentStarSystem.fuelDepotProperties.fuelIncreasePerDepot;

  FuelDepotComponent({this.anchorLength = 0.5})
      : super(shapeVertices: _fuelDepotShape, relativeAnchorLength: anchorLength);

  final double anchorLength;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.topCenter;

    paint = BasicPalette.blue.withAlpha(160).paint()
      ..style = PaintingStyle.fill;
    await add(PolygonHitbox(vertices));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is PlayerShield) {
      gameRef.remove(this);
      if (fuelRemaining > 0) { // prevent multiple shields consuming multiple times
        gameRef.gameState.addFuel(gameRef.gameState.currentStarSystem.fuelDepotProperties.fuelIncreasePerDepot);
        fuelRemaining = 0;
      }
      gameRef.audio.playSfx(SfxType.fuelScooped);
    }
    super.onCollision(intersectionPoints, other);
  }
}
