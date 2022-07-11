import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../model/planet.dart';
import '../player_game.dart';

class PlanetSprite extends SpriteComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  PlanetSprite({required this.planet})
      : super(
    priority: 3,
    size: planet.starSystemSize,
  );

  final Planet planet;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.center;

    sprite = await gameRef.loadSprite(planet.imageFilename);

    position = planet.starSystemPosition;

    await add(CircleHitbox.relative(1.0, parentSize: this.size));
  }
}
