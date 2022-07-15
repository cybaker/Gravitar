import 'package:Gravitar/src/game/components/fuel_depot.dart';
import 'package:Gravitar/src/game/components/planet_sprite.dart';
import 'package:Gravitar/src/game/components/star_sprite.dart';
import 'package:flame/components.dart';

import '../components/reactor.dart';
import 'gravity.dart';
import 'planet.dart';
import '../components/base_enemy.dart';
import '../components/enemy_ship.dart';
import '../player/player.dart';

///
/// A StarSystem is where a player plays a game level.
/// One star in the center draws the player ship in.
/// Player flies ship to a planet to do battle.
/// Ship enemies try to blast the player before they can get to a planet.
///
class StarSystem {
  StarSystem({
    required this.gravity,
    required this.planets,
    required this.starImageFilename,
    required this.startWarpInPosition,
    required this.playerProperties,
    required this.basicEnemyProperties,
    required this.shipEnemyProperties,
    required this.fuelDepotProperties,
    required this.reactorProperties,
  });

  final Gravity gravity;
  final String starImageFilename;
  final Vector2 startWarpInPosition;
  final List<Planet> planets;
  final PlayerProperties playerProperties;
  final EnemyBaseProperties basicEnemyProperties;
  final EnemyShipProperties shipEnemyProperties;
  final FuelDepotProperties fuelDepotProperties;
  final ReactorProperties reactorProperties;

  late Vector2 currentWarpInPosition = startWarpInPosition;

  List<PositionComponent> unconqueredStarSystemComponents() {
    List<PositionComponent> components = [];
    planets.forEach((planet) {
      if (planet.numEnemies != 0) {
        components.add(PlanetSprite(planet: planet));
      }
    });
    components.add(StarSprite(imageFilename: starImageFilename, starPosition: gravity.gravityCenter, size: Vector2(400, 400)));
    return components;
  }
}