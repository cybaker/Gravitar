import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'levels.dart';

Vector2 _planet4SegmentsOffset = Vector2(0, 300);

List<PlanetSegment> _planetSegments4 = [
  PlanetSegment(positionEnd: Vector2(314, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(370, 69), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(314, 133), segmentComponents: [EnemyBaseComponent(anchorLength: 0.2)]),
  PlanetSegment(positionEnd: Vector2(382, 209), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(305, 209), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(238, 138), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(181, 221), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(254, 221), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(119, 396), segmentComponents: [EnemyBaseComponent(anchorLength: 0.4)]),
  PlanetSegment(positionEnd: Vector2(198, 396), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(138, 496), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(288, 655), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(370, 655), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(434, 581), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(370, 581), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(304, 506), segmentComponents: [EnemyBaseComponent(anchorLength: 0.8)]),
  PlanetSegment(positionEnd: Vector2(442, 506), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(675, 209), segmentComponents: [EnemyBaseComponent(anchorLength: 0.4), EnemyBaseComponent(anchorLength: 0.9)]),
  PlanetSegment(positionEnd: Vector2(733, 209), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(684, 281), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(749, 358), segmentComponents: [EnemyBaseComponent(anchorLength: 0.3)]),
  PlanetSegment(positionEnd: Vector2(820, 358), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(749, 444), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(554, 507), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(618, 580), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(758, 580), segmentComponents: [FuelDepotComponent(anchorLength: 0.7)]),
  PlanetSegment(positionEnd: Vector2(891, 357), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(821, 281), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(759, 281), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(813, 209), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(733, 133), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(567, 133), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(500, 209), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(425, 129), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(563, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(660, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(956, 345), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(716, 682), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(284, 682), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(32, 406), segmentComponents: []),
];

PlanetShape _planet4PlanetShape = PlanetShape(offset: _planet4SegmentsOffset, segments: _planetSegments4);

var planet4 =
Planet(
    gravity: planetCenterGravityNormal,
    planetShapes: [_planet4PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 300),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'planet4.jpeg');

var planet4Easy =
Planet(
    gravity: planetCenterGravityEasy,
    planetShapes: [_planet4PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 300),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'planet4.jpeg');

var planet4Hard =
Planet(
    gravity: planetCenterGravityHard,
    planetShapes: [_planet4PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 300),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'planet4.jpeg');

var planet4Insane =
Planet(
    gravity: planetCenterGravityInsane,
    planetShapes: [_planet4PlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 300),
    starSystemSize: Vector2(60, 60),
    imageFilename: 'planet4.jpeg');
