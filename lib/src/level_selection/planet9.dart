import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

List<PlanetSegment> _planet9Large1 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(150, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(100, 50), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(75, 128), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(50, 50), segmentComponents: []),
];

List<PlanetSegment> _planet9Large2 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(150, 0), segmentComponents: [FuelDepotComponent(anchorLength: 0.4)]),
  PlanetSegment(positionEnd: Vector2(100, 50), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(75, 128), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(50, 50), segmentComponents: []),
];

List<PlanetSegment> _planet9Large3 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(
      positionEnd: Vector2(150, 0),
      segmentComponents: [EnemyBaseComponent(anchorLength: 0.25), FuelDepotComponent(anchorLength: 0.75)]),
  PlanetSegment(positionEnd: Vector2(100, 50), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(75, 128), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(50, 50), segmentComponents: []),
];

List<PlanetSegment> _planet9Large4 = [
  PlanetSegment(positionEnd: Vector2(150, 0), segmentComponents: [FuelDepotComponent(anchorLength: 0.2)]),
  PlanetSegment(positionEnd: Vector2(100, 50), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(75, 128), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(50, 50), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: [EnemyBaseComponent()]),
];

PlanetShape _planetShape9LargeA = PlanetShape(offset: Vector2(450, 400), segments: _planet9Large1);
PlanetShape _planetShape9LargeB = PlanetShape(offset: Vector2(15, 647), segments: _planet9Large2);
PlanetShape _planetShape9LargeC = PlanetShape(offset: Vector2(206, 647), segments: _planet9Large3);
PlanetShape _planetShape9LargeD = PlanetShape(offset: Vector2(771, 528), segments: _planet9Large4);

List<PlanetSegment> _planet9Small1 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(95, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(63, 25), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(45, 64), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(29, 25), segmentComponents: []),
];

List<PlanetSegment> _planet9Small2 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(95, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(63, 25), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(45, 64), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(29, 25), segmentComponents: []),
];

List<PlanetSegment> _planet9Small3 = [
  PlanetSegment(positionEnd: Vector2(95, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(63, 25), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(45, 64), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(29, 25), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: [EnemyBaseComponent()]),
];

List<PlanetSegment> _planet9Small4 = [
  PlanetSegment(positionEnd: Vector2(95, 0), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(63, 25), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(45, 64), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(29, 25), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: [EnemyBaseComponent()]),
];

PlanetShape _planetShape9SmallA = PlanetShape(offset: Vector2(327, 472), segments: _planet9Small1);
PlanetShape _planetShape9SmallB = PlanetShape(offset: Vector2(633, 472), segments: _planet9Small2);
PlanetShape _planetShape9SmallC = PlanetShape(offset: Vector2(146, 568), segments: _planet9Small3);
PlanetShape _planetShape9SmallD = PlanetShape(offset: Vector2(844, 664), segments: _planet9Small1);
PlanetShape _planetShape9SmallE = PlanetShape(offset: Vector2(365, 700), segments: _planet9Small1);
PlanetShape _planetShape9SmallF = PlanetShape(offset: Vector2(495, 700), segments: _planet9Small4);
PlanetShape _planetShape9SmallG = PlanetShape(offset: Vector2(677, 700), segments: _planet9Small4);

class _Planet9 extends Planet {
  final Gravity gravity;

  var flicker;
  int difficulty;

  _Planet9(this.gravity, {this.flicker = 0.0, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [
            _planetShape9LargeA,
            _planetShape9LargeB,
            _planetShape9LargeC,
            _planetShape9LargeD,
            _planetShape9SmallA,
            _planetShape9SmallB,
            _planetShape9SmallC,
            _planetShape9SmallD,
            _planetShape9SmallE,
            _planetShape9SmallF,
            _planetShape9SmallG,
          ],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(100, 100),
          starSystemSize: Vector2(90, 90),
          imageFilename: 'mercury1.jpeg',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet9Easy = _Planet9(
  downGravityEasy,
  difficulty: 1,
);
var planet9Normal = _Planet9(
  downGravityNormal,
  difficulty: 1,
);
var planet9Hard = _Planet9(
  downGravityHard,
  difficulty: 2,
);
var planet9Insane = _Planet9(
  downGravityInsane,
  difficulty: 3,
);

var planet9EasyReverse = _Planet9(
  upGravityEasy,
  difficulty: 1,
);
var planet9NormalReverse = _Planet9(
  upGravityNormal,
  difficulty: 1,
);
var planet9HardReverse = _Planet9(
  upGravityHard,
  difficulty: 2,
);
var planet9InsaneReverse = _Planet9(
  upGravityInsane,
  difficulty: 3,
);

var planet9EasyFlicker = _Planet9(downGravityEasy, flicker: 0.05, difficulty: 1);
var planet9NormalFlicker = _Planet9(downGravityNormal, flicker: 0.05, difficulty: 1);
var planet9HardFlicker = _Planet9(downGravityHard, flicker: 0.05, difficulty: 2);
var planet9InsaneFlicker = _Planet9(downGravityInsane, flicker: 0.05, difficulty: 3);
