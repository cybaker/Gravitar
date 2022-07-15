
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../../../src/audio/sounds.dart';
import 'explosion.dart';
import 'segment_component.dart';
import 'bullet.dart';

class ReactorProperties {
  ReactorProperties({
    this.countdownSeconds = 10,
  });

  final double countdownSeconds;
}

List<Vector2> _reactorShape = [
  Vector2(20, 0),
  Vector2(40, -20),
  Vector2(20, -40),
  Vector2(-20, -40),
  Vector2(-40, -20),
  Vector2(-20, 0)
];

class ReactorComponent  extends SegmentComponent with CollisionCallbacks {

  bool countDown = false;

  late var tickCount = 1.0;
  late int remainingSeconds = countdownSeconds;
  late TextComponent textComponent;

  ReactorComponent({this.anchorLength = 0.5})
      : super(shapeVertices: _reactorShape, relativeAnchorLength: anchorLength);

  final double anchorLength;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.bottomCenter;

    paint = PaletteEntry(Color(0xFF6666FF)).paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    await add(PolygonHitbox(vertices));

    textComponent = TextComponent(text: remainingSeconds.toString(), textRenderer: TextPaint())
      ..anchor = Anchor.center
      ..angle = -this.angle
      ..x = size.x/2
      ..y = size.y/2;
    add(textComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (countDown) updateTimeToLive(dt);
  }


  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Bullet) {
      countDown = true;
    }
    super.onCollision(intersectionPoints, other);
  }

  void updateTimeToLive(double deltaTime) {
    tickCount -= deltaTime;
    if (tickCount < 0) oneSecondExpired();
  }

  void oneSecondExpired() {
    remainingSeconds <= 0 ? countdownExpired() :  countdownTick();
  }

  void countdownExpired() {
    gameRef.remove(this);
    gameRef.add(reactorExplosion(position));
  }

  void countdownExpired1() {
    gameRef.playerHit();
    countDown = false;
    remainingSeconds = countdownSeconds;
  }


  int get countdownSeconds => gameRef.gameState.currentStarSystem.reactorProperties.countdownSeconds.toInt();

  void countdownTick() {
    remainingSeconds -= 1;
    textComponent.text = remainingSeconds.toString();
    tickCount = 1;
    gameRef.audio.playSfx(SfxType.buttonTap);
  }
}
