import 'dart:math';
import 'dart:ui';
import 'dart:async' as async;

import 'package:Gravitar/src/game/components/segment_component.dart';
import 'package:Gravitar/src/game/extensions/component_effects.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../../audio/sounds.dart';
import '../player/player.dart';
import 'enemy_bullet.dart';
import 'explosion.dart';

class EnemyBaseProperties {
  EnemyBaseProperties({
    this.averageFireTimeSec = 0.5,
    this.bulletSpeed = 100,
    this.bulletLifetimeSecs = 2,
    this.firingRangeToPlayer = 200,
    this.pointsPerEnemy = 250,
  });

  final double averageFireTimeSec;
  final double bulletSpeed;
  final double bulletLifetimeSecs;
  final double firingRangeToPlayer;
  final double pointsPerEnemy;
}

List<Vector2> _basicEnemyBaseShape = [
  Vector2(0, 0),
  Vector2(-10, 0),
  Vector2(-10, -10),
  Vector2(-5, -10),
  Vector2(0, -15),
  Vector2(5, -10),
  Vector2(10, -10),
  Vector2(10, 0),
];

class EnemyBaseComponent extends SegmentComponent with CollisionCallbacks {
  EnemyBaseComponent({this.anchorLength = 0.5})
      : super(shapeVertices: _basicEnemyBaseShape, relativeAnchorLength: anchorLength);

  final double anchorLength;

  double fireTimeout = 0;
  double playerAngle = 0;

  late Vector2 firingPosition;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.bottomCenter;

    paint = BasicPalette.red.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    await add(PolygonHitbox(vertices));

    setFiringPosition();
  }

  @override
  void update(double dt) {
    super.update(dt);
    playerAngle = angleToPlayer;
    _fireTimerTick(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      gameRef.remove(this);
    }
    super.onCollision(intersectionPoints, other);
  }

  void damage() {
    gameRef.remove(this);
    gameRef.audio.playSfx(SfxType.enemyDestroyed);
    gameRef.gameState.addScoreAndBumpLives(properties.pointsPerEnemy.toInt());
    _addExplosion();
    gameRef.enemyDestroyed();
  }

  _addExplosion() {
    gameRef.add(shipExplosion(position));
  }

  _fireTimerTick(double dt) {
    fireTimeout -= dt;
    if(fireTimeout <= 0) {
      fireTimeout = this.randomFromTo(0.5*properties.averageFireTimeSec, 2*properties.averageFireTimeSec);
      if (playerInFiringRange && playerInAngleRange) _fireSomething();
    }
  }

  void _fireSomething() {
    if (this.randomPercentOfTime(10)) {
      _fireTimeBurst();
    } else if (this.randomPercentOfTime(10)) {
      _fireAngleSpread();
    } else {
      _fireBullet(playerAngle);
    }
  }

  void _fireAngleSpread() {
    _fireBullet(playerAngle - pi/30);
    _fireBullet(playerAngle);
    _fireBullet(playerAngle + pi/30);
  }

  void _fireTimeBurst() {
    async.Timer(Duration(milliseconds: 100), _fireOne);
    async.Timer(Duration(milliseconds: 200), _fireOne);
    async.Timer(Duration(milliseconds: 300), _fireOne);
  }

  _fireOne() {
    _fireBullet(playerAngle);
  }

  _fireBullet(double playerAngle) {
    // debugPrint('Distance to player = ${this.distance(gameRef.singlePlayer)}');
    final bulletVector = unitVectorToAngle(playerAngle, properties.bulletSpeed); // aim directly at player
    gameRef.add(EnemyBullet(
        radius: 1,
        velocityVector: bulletVector,
        initialPosition: firingPosition,
        timeToLive: properties.bulletLifetimeSecs));

    gameRef.audio.playSfx(SfxType.enemyBullet);
  }

  bool get playerInFiringRange => this.distance(gameRef.singlePlayer) < properties.firingRangeToPlayer;

  EnemyBaseProperties get properties => gameRef.gameState.currentStarSystem.basicEnemyProperties;

  void setFiringPosition() {
    var offset = Vector2(0, -20);
    offset.rotate(angle);
    firingPosition = this.position + offset;
  }

  ///   angle is 0 to 2*pi from N clockwise
  ///   playerAngle is -pi to pi, 0 pointing S counterclockwise
  bool get playerInAngleRange {
    var relativeAngle = (angle + (playerAngle-pi)) % (2*pi);
    return relativeAngle < pi/2 || relativeAngle > pi*3/2;
  }

  double get angleToPlayer =>
      atan2(gameRef.singlePlayer.position.x - firingPosition.x,
        gameRef.singlePlayer.position.y - firingPosition.y);

  Vector2 unitVectorToAngle(double angle, double length) {
    return Vector2(length*sin(angle), length*cos(angle));
  }
}
