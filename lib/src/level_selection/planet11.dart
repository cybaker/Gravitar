import 'package:flame/components.dart';

import '../game/components/base_enemy.dart';
import '../game/components/fuel_depot.dart';
import '../game/components/planet_exit.dart';
import '../game/model/gravity.dart';
import '../game/model/planet.dart';
import '../game/model/planet_segment.dart';
import '../game/model/planet_shape.dart';
import 'level_properties.dart';

List<PlanetSegment> _planetSegments11 = [
  PlanetSegment(positionEnd: Vector2(0,0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(80,0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(37, 65), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(130, 205), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(242, 205), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(273, 179), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(290, 118), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(325, 118), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(342, 95), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(380, 95), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(342, 40), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(310, 22), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(273, 22), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(244, 48), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(196, 125), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(164, 125), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(129, 67), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(114, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(425, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(446, 25), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(425, 50), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(488, 92), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(459, 144), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(434, 105), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(404, 125), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(371, 175), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(407, 206), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(446, 206), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(468, 179), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(504, 169), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(532, 149), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(563, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(504, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(566, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(621, 121), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(679, 149), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(700, 192), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(745, 192), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(763, 149), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(798, 145), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(822, 100), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(863, 100), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(818, 40), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(750, 40), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(738, 65), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(685, 65), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(671, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(650, 88), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(620, 40), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(608, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(850, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(900, 143), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(931, 143), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(944, 120), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(990, 120), segmentComponents: [FuelDepotComponent()]),
  PlanetSegment(positionEnd: Vector2(950, 48), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(905, 48), segmentComponents: [EnemyBaseComponent()]),
  PlanetSegment(positionEnd: Vector2(920, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(1000, 0), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(1000, 225), segmentComponents: []),
  PlanetSegment(positionEnd: Vector2(0, 225), segmentComponents: []),
];

PlanetShape _planet11PlanetShape = PlanetShape(offset: Vector2(0, 400), segments: _planetSegments11);

class _Planet11 extends Planet {
  final Gravity gravity;

  var flicker;

  _Planet11(this.gravity, {this.flicker = false})
      : super(
      gravity: gravity,
      planetShapes: [_planet11PlanetShape],
      planetExits: [SurroundPlanetExitComponent()],
      starSystemPosition: Vector2(800, 900),
      starSystemSize: Vector2(120, 120),
      imageFilename: 'neptune1.jpeg',
      flicker: flicker,
  );
}

var planet11Easy = _Planet11(downGravityEasy,);
var planet11Normal = _Planet11(downGravityNormal,);
var planet11Hard = _Planet11(downGravityHard,);
var planet11Insane = _Planet11(downGravityInsane,);

var planet11EasyReverse = _Planet11(upGravityEasy,);
var planet11NormalReverse = _Planet11(upGravityNormal,);
var planet11HardReverse = _Planet11(upGravityHard,);
var planet11InsaneReverse = _Planet11(upGravityInsane,);

var planet11EasyFlicker = _Planet11(downGravityEasy, flicker: true);
var planet11NormalFlicker = _Planet11(downGravityNormal, flicker: true);
var planet11HardFlicker = _Planet11(downGravityHard, flicker: true);
var planet11InsaneFlicker = _Planet11(downGravityInsane, flicker: true);
