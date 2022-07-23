import 'package:Gravitar/src/game/components/reactor.dart';
import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

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

class _Reactor extends Planet {
  final Gravity gravity;

  var flicker;

  _Reactor(this.gravity, {this.flicker = false})
      : super(
      gravity: gravity,
      planetShapes: [_reactorPlanetShape],
      planetExits: [SurroundPlanetExitComponent()],
      starSystemPosition: Vector2(200, 900),
      starSystemSize: Vector2(240, 120),
      imageFilename: 'saturn1.jpeg',
      flicker: flicker,
  );
}

var reactorEasy = _Reactor(centerGravityEasy,);
var reactorNormal = _Reactor(centerGravityNormal,);
var reactorHard = _Reactor(centerGravityHard,);
var reactorInsane = _Reactor(centerGravityInsane,);

var reactorEasyReverse = _Reactor(centerGravityEasyReverse,);
var reactorNormalReverse = _Reactor(centerGravityNormalReverse,);
var reactorHardReverse = _Reactor(centerGravityHardReverse,);
var reactorInsaneReverse = _Reactor(centerGravityInsaneReverse,);

var reactorEasyFlicker = _Reactor(centerGravityEasy, flicker: true);
var reactorNormalFlicker = _Reactor(centerGravityNormal, flicker: true);
var reactorHardFlicker = _Reactor(centerGravityHard, flicker: true);
var reactorInsaneFlicker = _Reactor(centerGravityInsane, flicker: true);
