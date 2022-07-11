import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../player_game.dart';

class StarSprite extends SpriteComponent with HasGameRef<PlayerGame>, CollisionCallbacks {
  StarSprite({required this.imageFilename, required this.starPosition, required Vector2 size})
      : super(
    priority: 1,
    size: size,
  );

  final String imageFilename;
  final Vector2 starPosition;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.center;

    sprite = await gameRef.loadSprite(imageFilename);

    position = starPosition;

    // var circle = CircleComponent(radius: (size.x*0.8)/2, position: Vector2(size.x*0.1, size.y*0.1));
    // circle.paint = BasicPalette.blue.paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 4;

    var hitbox = CircleHitbox(radius: (size.x*0.8)/2, position: Vector2(size.x*0.1, size.y*0.1));

    await addAll([
      // circle,
      hitbox,
    ]);
  }
}
