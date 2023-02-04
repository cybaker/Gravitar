import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

Vector2 _planet1SegmentsOffset = Vector2(0, 200);

List<PlanetSegment> _planetSegments1 = [
  PlanetSegment(positionEnd: Vector2(600, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(656, 162), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(709, 162), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(747, 204), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(791, 234), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(852, 316), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(872, 316), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(911, 375), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(890, 400), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(816, 400), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(792, 425), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(816, 454), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(816, 545), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(800, 570), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(756, 570), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(703, 645), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(732, 645), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(700, 686), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(632, 638), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(713, 526), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(492, 526), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(456, 496), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(393, 496), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(346, 548), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(393, 593), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(340, 660), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(280, 660), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(321, 606), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(257, 545), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(225, 575), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(183, 535), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(121, 535), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(175, 458), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(132, 458), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(71, 400), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(159, 400), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(245, 284), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(275, 284), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(325, 204), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(375, 204), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(316, 158), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(346, 118), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(395, 160), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(492, 160), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(550, 92), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(506, 50), segmentComponents: [EnemyBaseComponent(anchorLength: 0.2)]),
  PlanetSegment(positionEnd: Vector2(465, 43), segmentComponents: []),
];

PlanetShape _planet1PlanetShape = PlanetShape(offset: _planet1SegmentsOffset, segments: _planetSegments1);

class _Planet1 extends Planet {
  final Gravity gravity;

  var flicker;
  int difficulty;

  _Planet1(this.gravity, {this.flicker = false, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [_planet1PlanetShape],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(300, 100),
          starSystemSize: Vector2(60, 60),
          imageFilename: 'planet1.png',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet1Easy = _Planet1(centerGravityEasy, difficulty: 1);
var planet1Normal = _Planet1(centerGravityNormal, difficulty: 1);
var planet1Hard = _Planet1(centerGravityHard, difficulty: 2);
var planet1Insane = _Planet1(centerGravityInsane, difficulty: 3);

var planet1EasyReverse = _Planet1(centerGravityEasyReverse, difficulty: 1);
var planet1NormalReverse = _Planet1(centerGravityNormalReverse, difficulty: 1);
var planet1HardReverse = _Planet1(centerGravityHardReverse, difficulty: 2);
var planet1InsaneReverse = _Planet1(centerGravityInsaneReverse, difficulty: 3);

var planet1EasyFlicker = _Planet1(centerGravityEasy, flicker: true, difficulty: 1);
var planet1NormalFlicker = _Planet1(centerGravityNormal, flicker: true, difficulty: 1);
var planet1HardFlicker = _Planet1(centerGravityHard, flicker: true, difficulty: 2);
var planet1InsaneFlicker = _Planet1(centerGravityInsane, flicker: true, difficulty: 3);
