import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

Vector2 _planet5SegmentsOffset = Vector2(0, 500);

List<PlanetSegment> _planetSegments5 = [
  PlanetSegment(positionEnd: Vector2(166, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(228, 56), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(108, 206), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(
      positionEnd: Vector2(408, 206),
      segmentComponents: [FuelDepotComponent(anchorLength: 0.2), FuelDepotComponent(anchorLength: 0.8)]),
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

  var flicker;
  int difficulty;

  _Planet5(this.gravity, {this.flicker = false, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [_planet5PlanetShape],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(850, 500),
          starSystemSize: Vector2(90, 90),
          imageFilename: 'planet5.jpeg',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet5Easy = _Planet5(
  downGravityEasy,
  difficulty: 1,
);
var planet5Normal = _Planet5(
  downGravityNormal,
  difficulty: 1,
);
var planet5Hard = _Planet5(
  downGravityHard,
  difficulty: 2,
);
var planet5Insane = _Planet5(
  downGravityInsane,
  difficulty: 3,
);

var planet5EasyReverse = _Planet5(
  upGravityEasy,
  difficulty: 1,
);
var planet5NormalReverse = _Planet5(
  upGravityNormal,
  difficulty: 1,
);
var planet5HardReverse = _Planet5(
  upGravityHard,
  difficulty: 2,
);
var planet5InsaneReverse = _Planet5(
  upGravityInsane,
  difficulty: 3,
);

var planet5EasyFlicker = _Planet5(downGravityEasy, flicker: true, difficulty: 1);
var planet5NormalFlicker = _Planet5(downGravityNormal, flicker: true, difficulty: 1);
var planet5HardFlicker = _Planet5(downGravityHard, flicker: true, difficulty: 2);
var planet5InsaneFlicker = _Planet5(downGravityInsane, flicker: true, difficulty: 3);
