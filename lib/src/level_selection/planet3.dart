import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'levels.dart';

List<PlanetSegment> _planetSegments3part1 = [
  PlanetSegment(positionEnd: Vector2(57, 588), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(75, 588), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(94, 560), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(111, 605), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(82, 656), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(171, 656), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(220, 575), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(178, 515), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(212, 490), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(238, 490), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(282, 560), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(250, 612), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(338, 612), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(370, 553), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(338, 484), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(358, 484), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(411, 515), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(341, 630), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(375, 668), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(438, 668), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(476, 588), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(463, 515), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(520, 532), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(550, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(600, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(638, 550), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(671, 581), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(707, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(842, 655), segmentComponents: [FuelDepotComponent(anchorLength: 0.3)]),
  PlanetSegment(positionEnd: Vector2(821, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(855, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(896, 525), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(938, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(960, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(960, 700), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(57, 700), segmentComponents: []),
];

List<PlanetSegment> _planetSegments3part2 = [
  PlanetSegment(positionEnd: Vector2(719, 506), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(838, 506), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(767, 600), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(725, 583), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(741, 542), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(719, 506), segmentComponents: [EnemyBaseComponent()]),
];


PlanetShape _planet3PlanetShape1 = PlanetShape(offset: Vector2(57, 588), segments: _planetSegments3part1);
PlanetShape _planet3PlanetShape2 = PlanetShape(offset: Vector2(719, 506), segments: _planetSegments3part2);

var planet3 =
Planet(
    gravity: downGravity,
    planetShapes: [_planet3PlanetShape1, _planet3PlanetShape2],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 600),
    starSystemSize: Vector2(100, 100),
    imageFilename: 'jupiter1.jpeg'
);

var planet3Easy =
Planet(
    gravity: downGravityEasy,
    planetShapes: [_planet3PlanetShape1, _planet3PlanetShape2],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 600),
    starSystemSize: Vector2(100, 100),
    imageFilename: 'jupiter1.jpeg'
);

var planet3Hard =
Planet(
    gravity: downGravityHard,
    planetShapes: [_planet3PlanetShape1, _planet3PlanetShape2],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 600),
    starSystemSize: Vector2(100, 100),
    imageFilename: 'jupiter1.jpeg'
);
