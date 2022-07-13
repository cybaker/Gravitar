import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'levels.dart';

List<PlanetSegment> _planetSegments2part1 = [
  PlanetSegment(positionEnd: Vector2(46, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(70, 504), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(214, 504), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(236, 532), segmentComponents: []),
];

List<PlanetSegment> _planetSegments2part2 = [
  PlanetSegment(positionEnd: Vector2(317, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(325, 504), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(438, 504), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(460, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(421, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(405, 555), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(394, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(346, 532), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(334, 564), segmentComponents: []),
];

List<PlanetSegment> _planetSegments2part3 = [
  PlanetSegment(positionEnd: Vector2(519, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(544, 504), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(938, 504), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(951, 524), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(930, 571), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(913, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(629, 532), segmentComponents: [EnemyBaseComponent(anchorLength: 0.1)]),
  PlanetSegment(positionEnd: Vector2(618, 565), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(604, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(569, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(550, 578), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(541, 532), segmentComponents: []),
];

List<PlanetSegment> _planetSegments2part4 = [
  PlanetSegment(positionEnd: Vector2(24, 700), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(29, 630), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(34, 664), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(67, 664), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(83, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(96, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(112, 632), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(132, 680), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(169, 680), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(182, 665), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(204, 607), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(218, 664), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(245, 690), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(258, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(332, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(363, 684), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(374, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(394, 655), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(408, 690), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(430, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(450, 688), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(500, 688), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(519, 640), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(545, 640), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(553, 615), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(561, 640), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(570, 615), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(576, 640), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(608, 640), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(613, 676), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(633, 676), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(644, 656), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(656, 621), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(675, 688), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(705, 688), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(719, 646), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(735, 680), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(750, 671), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(780, 671), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(800, 619), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(816, 671), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(838, 650), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(867, 654), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(925, 677), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(943, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(978, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(978, 700), segmentComponents: []),
];

PlanetShape _planet2PlanetShape1 = PlanetShape(offset: Vector2(46, 532), segments: _planetSegments2part1);
PlanetShape _planet2PlanetShape2 = PlanetShape(offset: Vector2(317, 532), segments: _planetSegments2part2);
PlanetShape _planet2PlanetShape3 = PlanetShape(offset: Vector2(519, 532), segments: _planetSegments2part3);
PlanetShape _planet2PlanetShape4 = PlanetShape(offset: Vector2(24, 700), segments: _planetSegments2part4);

var planet2 =
Planet(
    gravity: downGravity,
    planetShapes: [_planet2PlanetShape1, _planet2PlanetShape2, _planet2PlanetShape3, _planet2PlanetShape4, ],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(700, 200),
    starSystemSize: Vector2(80, 80),
    imageFilename: 'planet2.png');

var planet2Easy =
Planet(
    gravity: downGravityEasy,
    planetShapes: [_planet2PlanetShape1, _planet2PlanetShape2, _planet2PlanetShape3, _planet2PlanetShape4, ],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(700, 200),
    starSystemSize: Vector2(80, 80),
    imageFilename: 'planet2.png');

var planet2Hard =
Planet(
    gravity: downGravityHard,
    planetShapes: [_planet2PlanetShape1, _planet2PlanetShape2, _planet2PlanetShape3, _planet2PlanetShape4, ],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(700, 200),
    starSystemSize: Vector2(80, 80),
    imageFilename: 'planet2.png');

var planet2Insane =
Planet(
    gravity: downGravityInsane,
    planetShapes: [_planet2PlanetShape1, _planet2PlanetShape2, _planet2PlanetShape3, _planet2PlanetShape4, ],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(700, 200),
    starSystemSize: Vector2(80, 80),
    imageFilename: 'planet2.png');
