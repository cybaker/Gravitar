import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'levels.dart';

Vector2 _planet5SegmentsOffset = Vector2(0, 500);

List<PlanetSegment> _planetSegments5 = [
  PlanetSegment(positionEnd: Vector2(166, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(228, 56), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(108, 206), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(408, 206), segmentComponents: [FuelDepotComponent(anchorLength: 0.2), FuelDepotComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(294, 56), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(350, 0), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(457, 136), segmentComponents: [EnemyBaseComponent(anchorLength: 0.7)]),
  PlanetSegment(positionEnd: Vector2(571, 136), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(450, 265), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(525, 265), segmentComponents: [EnemyBaseComponent(), FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(638, 136), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(733, 136), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(671, 70), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(854, 70), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(792, 136), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(944, 136), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(944, 298), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(43, 298), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(43, 155), segmentComponents: []),
];

PlanetShape _planet5PlanetShape = PlanetShape(offset: _planet5SegmentsOffset, segments: _planetSegments5);

class _Planet5 extends Planet {
  final Gravity gravity;

  _Planet5(this.gravity)
      : super(
      gravity: gravity,
      planetShapes: [_planet5PlanetShape],
      planetExits: [SurroundPlanetExitComponent()],
      starSystemPosition: Vector2(850, 500),
      starSystemSize: Vector2(90, 90),
      imageFilename: 'planet5.jpeg'
  );
}

var planet5Easy = _Planet5(downGravityEasy,);

var planet5Normal = _Planet5(downGravityNormal,);

var planet5Hard = _Planet5(downGravityHard,);

var planet5Insane = _Planet5(downGravityInsane,);