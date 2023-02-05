import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

List<PlanetSegment> _planet6Segments1 = [
  PlanetSegment(positionEnd: Vector2(296, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(344, 50), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(292, 175), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(238, 175), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(288, 304), segmentComponents: [EnemyBaseComponent(anchorLength: 0.6)]),
  PlanetSegment(positionEnd: Vector2(357, 304), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(421, 482), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(488, 482), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(542, 420), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(967, 420), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(967, 512), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(31, 512), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(31, 463), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(63, 463), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(93, 350), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(45, 350), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(93, 258), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(129, 258), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(236, 0), segmentComponents: [EnemyBaseComponent(anchorLength: 0.3)]),
];

List<PlanetSegment> _planet6Segments2 = [
  PlanetSegment(positionEnd: Vector2(600, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(636, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(699, 150), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(758, 214), segmentComponents: [EnemyBaseComponent(anchorLength: 0.3)]),
  PlanetSegment(positionEnd: Vector2(843, 214), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(898, 339), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(795, 339), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(821, 304), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(795, 263), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(754, 263), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(695, 188), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(579, 304), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(736, 304), segmentComponents: [FuelDepotComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(763, 339), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(543, 339), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(454, 241), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(575, 241), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(525, 188), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(642, 188), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(571, 33), segmentComponents: []),
];

Vector2 _planet6SegmentsOffset1 = Vector2(0, 300);
Vector2 _planet6SegmentsOffset2 = Vector2(450, 300);

PlanetShape _planet6PlanetShape1 = PlanetShape(offset: _planet6SegmentsOffset1, segments: _planet6Segments1);
PlanetShape _planet6PlanetShape2 = PlanetShape(offset: _planet6SegmentsOffset2, segments: _planet6Segments2);

class _Planet6 extends Planet {
  final Gravity gravity;

  var flicker;
  int difficulty;

  _Planet6(this.gravity, {this.flicker = 0.0, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [_planet6PlanetShape1, _planet6PlanetShape2],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(850, 100),
          starSystemSize: Vector2(120, 120),
          imageFilename: 'mimas1.jpeg',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet6Easy = _Planet6(
  downGravityEasy,
  difficulty: 1,
);
var planet6Normal = _Planet6(
  downGravityNormal,
  difficulty: 1,
);
var planet6Hard = _Planet6(
  downGravityHard,
  difficulty: 2,
);
var planet6Insane = _Planet6(
  downGravityInsane,
  difficulty: 3,
);

var planet6EasyReverse = _Planet6(
  upGravityEasy,
  difficulty: 1,
);
var planet6NormalReverse = _Planet6(
  upGravityNormal,
  difficulty: 1,
);
var planet6HardReverse = _Planet6(
  upGravityHard,
  difficulty: 2,
);
var planet6InsaneReverse = _Planet6(
  upGravityInsane,
  difficulty: 3,
);

var planet6EasyFlicker = _Planet6(downGravityEasy, flicker: 0.05, difficulty: 1);
var planet6NormalFlicker = _Planet6(downGravityNormal, flicker: 0.05, difficulty: 1);
var planet6HardFlicker = _Planet6(downGravityHard, flicker: 0.05, difficulty: 2);
var planet6InsaneFlicker = _Planet6(downGravityInsane, flicker: 0.05, difficulty: 3);
