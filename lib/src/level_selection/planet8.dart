import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

Vector2 _planet8SegmentsOffset = Vector2(100, 200);

List<PlanetSegment> _planet8Segment = [
  PlanetSegment(positionEnd: Vector2(175, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(289, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(341, 84), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(319, 168), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(257, 254), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(196, 254), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(300, 84), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(171, 84), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(54, 254), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(120, 325), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(267, 418), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(200, 538), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(122, 395), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(63, 542), segmentComponents: [EnemyBaseComponent(anchorLength: 0.3)]),
  PlanetSegment(positionEnd: Vector2(204, 696), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(278, 696), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(238, 616), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(334, 616), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(391, 696), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(446, 616), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(545, 616), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(506, 696), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(579, 696), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(719, 541), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(660, 394), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(582, 538), segmentComponents: [EnemyBaseComponent(anchorLength: 0.4)]),
  PlanetSegment(positionEnd: Vector2(514, 418), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(662, 325), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(729, 250), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(610, 83), segmentComponents: [EnemyBaseComponent(anchorLength: 0.3)]),
  PlanetSegment(positionEnd: Vector2(481, 83), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(587, 254), segmentComponents: [EnemyBaseComponent(anchorLength: 0.2)]),
  PlanetSegment(positionEnd: Vector2(525, 254), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(463, 168), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(444, 83), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(494, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(606, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(782, 254), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(782, 542), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(657, 724), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(125, 724), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 542), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 254), segmentComponents: []),
];

PlanetShape _planet8PlanetShape = PlanetShape(offset: _planet8SegmentsOffset, segments: _planet8Segment);

class _Planet8 extends Planet {
  final Gravity gravity;

  var flicker;
  int difficulty;

  _Planet8(this.gravity, {this.flicker = 0.0, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [_planet8PlanetShape],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(500, 800),
          starSystemSize: Vector2(85, 85),
          imageFilename: 'jupiter3.jpeg',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet8Easy = _Planet8(
  centerGravityEasy,
  difficulty: 1,
);
var planet8Normal = _Planet8(
  centerGravityNormal,
  difficulty: 1,
);
var planet8Hard = _Planet8(
  centerGravityHard,
  difficulty: 2,
);
var planet8Insane = _Planet8(
  centerGravityInsane,
  difficulty: 3,
);

var planet8EasyReverse = _Planet8(
  centerGravityEasyReverse,
  difficulty: 1,
);
var planet8NormalReverse = _Planet8(
  centerGravityNormalReverse,
  difficulty: 1,
);
var planet8HardReverse = _Planet8(
  centerGravityHardReverse,
  difficulty: 2,
);
var planet8InsaneReverse = _Planet8(
  centerGravityInsaneReverse,
  difficulty: 3,
);

var planet8EasyFlicker = _Planet8(centerGravityEasy, flicker: 0.05, difficulty: 1);
var planet8NormalFlicker = _Planet8(centerGravityNormal, flicker: 0.05, difficulty: 1);
var planet8HardFlicker = _Planet8(centerGravityHard, flicker: 0.05, difficulty: 2);
var planet8InsaneFlicker = _Planet8(centerGravityInsane, flicker: 0.05, difficulty: 3);
