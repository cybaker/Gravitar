import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

List<PlanetSegment> _planet7Segments1 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(54, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(7, 83), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(69, 158), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(133, 126), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(217, 159), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(275, 113), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(294, 132), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(221, 210), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(119, 210), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(92, 250), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(383, 250), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(443, 200), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(530, 200), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(588, 146), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(645, 146), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(709, 222), segmentComponents: []),
  PlanetSegment(
      positionEnd: Vector2(800, 222),
      segmentComponents: [FuelDepotComponent(anchorLength: 0.2), FuelDepotComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(831, 256), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(866, 210), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(885, 210), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(821, 304), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 304), segmentComponents: []),
];

List<PlanetSegment> _planet7Segments2 = [
  PlanetSegment(positionEnd: Vector2(118, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(999, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(999, 304), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(894, 263), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(967, 132), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(944, 113), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(917, 146), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(885, 118), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(838, 183), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(763, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(725, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(695, 139), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(683, 139), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(638, 80), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(583, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(526, 139), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(500, 139), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(463, 104), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(371, 210), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(304, 210), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(363, 122), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(294, 43), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(218, 114), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(138, 50), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(106, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(69, 88), segmentComponents: []),
];

Vector2 _planet7SegmentsOffset1 = Vector2(0, 400);
Vector2 _planet7SegmentsOffset2 = Vector2(69, 400);

PlanetShape _planet7PlanetShape1 = PlanetShape(offset: _planet7SegmentsOffset1, segments: _planet7Segments1);
PlanetShape _planet7PlanetShape2 = PlanetShape(offset: _planet7SegmentsOffset2, segments: _planet7Segments2);

class _Planet7 extends Planet {
  final Gravity gravity;

  var flicker;
  int difficulty;

  _Planet7(this.gravity, {this.flicker = 0.0, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [_planet7PlanetShape1, _planet7PlanetShape2],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(500, 900),
          starSystemSize: Vector2(50, 50),
          imageFilename: 'io1.jpeg',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet7Easy = _Planet7(
  downGravityEasy,
  difficulty: 1,
);
var planet7Normal = _Planet7(
  downGravityNormal,
  difficulty: 1,
);
var planet7Hard = _Planet7(
  downGravityHard,
  difficulty: 2,
);
var planet7Insane = _Planet7(
  downGravityInsane,
  difficulty: 3,
);

var planet7EasyReverse = _Planet7(
  upGravityEasy,
  difficulty: 1,
);
var planet7NormalReverse = _Planet7(
  upGravityNormal,
  difficulty: 1,
);
var planet7HardReverse = _Planet7(
  upGravityHard,
  difficulty: 2,
);
var planet7InsaneReverse = _Planet7(
  upGravityInsane,
  difficulty: 3,
);

var planet7EasyFlicker = _Planet7(downGravityEasy, flicker: 0.05, difficulty: 1);
var planet7NormalFlicker = _Planet7(downGravityNormal, flicker: 0.05, difficulty: 1);
var planet7HardFlicker = _Planet7(downGravityHard, flicker: 0.05, difficulty: 2);
var planet7InsaneFlicker = _Planet7(downGravityInsane, flicker: 0.05, difficulty: 3);
