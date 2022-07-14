import 'package:Gravitar/src/game/components/reactor.dart';
import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/planet_exit.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'levels.dart';

List<PlanetSegment> _planetSegmentsReactor = [
  PlanetSegment(positionEnd: Vector2(0,0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(132, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(250, 130), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(25, 345), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(266, 655), segmentComponents: [EnemyBaseComponent(anchorLength: 0.15), EnemyBaseComponent(anchorLength: 0.9)]),
  PlanetSegment(positionEnd: Vector2(592, 655), segmentComponents: [EnemyBaseComponent(anchorLength: 0.15), EnemyBaseComponent(anchorLength: 0.9)]),
  PlanetSegment(positionEnd: Vector2(866, 420), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(684, 182), segmentComponents: [EnemyBaseComponent(anchorLength: 0.15)]),
  PlanetSegment(positionEnd: Vector2(434, 182), segmentComponents: [EnemyBaseComponent(anchorLength: 0.15)]),
  PlanetSegment(positionEnd: Vector2(332, 290), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(519, 488), segmentComponents: [EnemyBaseComponent(anchorLength: 0.15)]),
  PlanetSegment(positionEnd: Vector2(643, 488), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(707, 433), segmentComponents: [ReactorComponent()]),
  PlanetSegment(positionEnd: Vector2(638, 350), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(525, 350), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(471, 283), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(650, 283), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(757, 430), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(569, 575), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(325, 575), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(140, 325), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(467, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(900, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(900, 900), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 900), segmentComponents: []),
];

PlanetShape _reactorPlanetShape = PlanetShape(offset: Vector2(0, 100), segments: _planetSegmentsReactor);

var reactor =
Planet(
    gravity: planetCenterGravityNormal,
    planetShapes: [_reactorPlanetShape],
    planetExits: [SurroundPlanetExitComponent()],
    starSystemPosition: Vector2(200, 900),
    starSystemSize: Vector2(240, 120),
    imageFilename: 'saturn1.jpeg',
);

var reactorEasy =
Planet(
  gravity: planetCenterGravityEasy,
  planetShapes: [_reactorPlanetShape],
  planetExits: [SurroundPlanetExitComponent()],
  starSystemPosition: Vector2(200, 900),
  starSystemSize: Vector2(240, 120),
  imageFilename: 'saturn1.jpeg',
);

var reactorHard =
Planet(
  gravity: planetCenterGravityHard,
  planetShapes: [_reactorPlanetShape],
  planetExits: [SurroundPlanetExitComponent()],
  starSystemPosition: Vector2(200, 900),
  starSystemSize: Vector2(240, 120),
  imageFilename: 'saturn1.jpeg',
);

var reactorInsane =
Planet(
  gravity: planetCenterGravityInsane,
  planetShapes: [_reactorPlanetShape],
  planetExits: [SurroundPlanetExitComponent()],
  starSystemPosition: Vector2(200, 900),
  starSystemSize: Vector2(240, 120),
  imageFilename: 'saturn1.jpeg',
);
