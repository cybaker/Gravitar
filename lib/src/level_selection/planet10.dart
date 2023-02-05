import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

List<PlanetSegment> _planetSegments10 = [
  PlanetSegment(positionEnd: Vector2(0, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(66, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(138, 81), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(200, 81), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(263, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(383, 0), segmentComponents: [EnemyBaseComponent(), FuelDepotComponent()]),
  PlanetSegment(
      positionEnd: Vector2(500, 167),
      segmentComponents: [EnemyBaseComponent(anchorLength: 0.3), EnemyBaseComponent(anchorLength: 0.7)]),
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

class _Planet10 extends Planet {
  final Gravity gravity;

  var flicker;
  int difficulty;

  _Planet10(this.gravity, {this.flicker = 0.0, this.difficulty = 1})
      : super(
          gravity: gravity,
          planetShapes: [_planet10PlanetShape],
          planetExits: [SurroundPlanetExitComponent()],
          starSystemPosition: Vector2(100, 750),
          starSystemSize: Vector2(60, 60),
          imageFilename: 'jupiter4.jpeg',
          flicker: flicker,
          difficulty: difficulty,
        );
}

var planet10Easy = _Planet10(
  downGravityEasy,
  difficulty: 1,
);
var planet10Normal = _Planet10(
  downGravityNormal,
  difficulty: 1,
);
var planet10Hard = _Planet10(
  downGravityHard,
  difficulty: 2,
);
var planet10Insane = _Planet10(
  downGravityInsane,
  difficulty: 3,
);

var planet10EasyReverse = _Planet10(
  upGravityEasy,
  difficulty: 1,
);
var planet10NormalReverse = _Planet10(
  upGravityNormal,
  difficulty: 2,
);
var planet10HardReverse = _Planet10(
  upGravityHard,
  difficulty: 3,
);
var planet10InsaneReverse = _Planet10(
  upGravityInsane,
);

var planet10EasyFlicker = _Planet10(downGravityEasy, flicker: 0.05, difficulty: 1);
var planet10NormalFlicker = _Planet10(downGravityNormal, flicker: 0.05, difficulty: 1);
var planet10HardFlicker = _Planet10(downGravityHard, flicker: 0.05, difficulty: 2);
var planet10InsaneFlicker = _Planet10(downGravityInsane, flicker: 0.05, difficulty: 3);
