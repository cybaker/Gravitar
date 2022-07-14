import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'levels.dart';

List<PlanetSegment> _planetSegments10 = [
  PlanetSegment(positionEnd: Vector2(0,0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(66, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(138, 81), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(200, 81), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(263, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(383, 0), segmentComponents: [EnemyBaseComponent(), FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(500, 167), segmentComponents: [EnemyBaseComponent(anchorLength: 0.3), EnemyBaseComponent(anchorLength: 0.7)]),
  PlanetSegment(positionEnd: Vector2(569, 167), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(634, 88), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(692, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(756, 0), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(813, 88), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(883, 88), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(941, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(999, 0), segmentComponents: [EnemyBaseComponent(), FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(906, 200), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(80, 200), segmentComponents: []),
];

PlanetShape _planet10PlanetShape = PlanetShape(offset: Vector2(0, 400), segments: _planetSegments10);

var planet10 =
Planet(
    gravity: downGravityNormal,
    planetShapes: [_planet10PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(100, 750),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'jupiter4.jpeg');

var planet10Easy =
Planet(
    gravity: downGravityEasy,
    planetShapes: [_planet10PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(100, 750),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'jupiter4.jpeg');

var planet10Hard =
Planet(
    gravity: downGravityHard,
    planetShapes: [_planet10PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(100, 750),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'jupiter4.jpeg');

var planet10Insane =
Planet(
    gravity: downGravityInsane,
    planetShapes: [_planet10PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(100, 750),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'jupiter4.jpeg');

