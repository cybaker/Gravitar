import 'dart:math';

import 'package:Gravitar/src/game/components/planet_exit.dart';
import 'package:Gravitar/src/game/components/planet_sprite.dart';
import 'package:Gravitar/src/game/components/star_sprite.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import '../../audio/sounds.dart';
import '../components/base_enemy.dart';
import '../components/bullet.dart';
import '../components/planet_polygon.dart';
import '../model/gravity.dart';
import '../player_game.dart';
import 'player_shield.dart';
import 'player_thrust.dart';

class PlayerProperties {

  PlayerProperties({
    this.playerThrust = 2,
    this.playerThrustConsumption = 5,
    this.playerFireConsumption = 5,
    this.playerShieldConsumption = 10,
    this.playerBulletFireLifetimeSecs = 2,
    this.playerBulletSpeed = 150,
    this.playerBulletReloadSecs = 0.2,
    this.playerBulletDamageToEnemy = 1,
  });

  final double playerThrust;
  final double playerThrustConsumption;
  final double playerFireConsumption;
  final double playerShieldConsumption;
  final double playerBulletFireLifetimeSecs;
  final double playerBulletSpeed;
  final double playerBulletReloadSecs;
  final double playerBulletDamageToEnemy;
}

List<Vector2> _playerShape = [
  Vector2(0, -5),
  Vector2(-5, 2),
  Vector2(-3, 5),
  Vector2(3, 5),
  Vector2(5, 2),
];

///
/// Player ship is central to the game, flies around and captures fuel, destroys enemies and planets.
/// Player can fire, shield, turn left and right, and thrust.
/// [lives] is what the player starts with on a level
class Player extends PolygonComponent with KeyboardHandler, HasGameRef<PlayerGame>, CollisionCallbacks {
  Player()
      : super(
          _playerShape,
          priority: 5,
        );
  static final _log = Logger('Player');

  PlayerThrust _thrustComponent = PlayerThrust();
  bool _isThrusting = false;

  PlayerShield _shieldComponent = PlayerShield(radius: 30, position: Vector2(-25, -25));
  bool _isShielding = false;

  Vector2 velocity = Vector2.zero();
  double fireTimeout = 0;

  static const halfPi = pi / 2;
  static const rotationSpeed = pi / 30;

  static const maxShipFuel = 100.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    anchor = Anchor.center;

    paint = PaletteEntry(Color(0xFF0066FF)).paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    await add(PolygonHitbox(vertices));
  }

  @override
  void update(double dt) {
    super.update(dt);

    _updatePosition(dt);
    _updateFireTimeout(dt);
    _handleKeyPresses();
    gameRef.cameraZoom();
  }

  void _updateFireTimeout(double dt) {
    fireTimeout -= dt;
  }

  void _updatePosition(double dt) {
    velocity += vectorToGravity;
    final newPosition = position + velocity * dt;
    position = newPosition;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is EnemyBaseComponent ||
        other is PlanetPolygon ||
        other is StarSprite) {
      _log.info(() => 'Player destroyed by $other');
      damageShip();
    } else if (other is PlanetExitComponent) {
      gameRef.exitPlanet();
    } else if (other is PlanetSprite) {
      gameRef.gameState.currentPlanet = other.planet;
      gameRef.loadPlanet();
    }

    super.onCollision(intersectionPoints, other);
  }

  damageShip() {
    gameRef.playerHit();
  }

  _thrustShip(double rotation, double thrust) {
      final newThrust = Vector2(cos(rotation - halfPi) * thrust, sin(rotation - halfPi) * thrust);
      final total = velocity + newThrust;
      if (total.x * total.x + total.y * total.y < 200 * 200) {
        // maximum speed
        velocity = total;
      }
      _thrustConsumePower();
      _showThrust(true);
  }

  _thrustConsumePower() {
    gameRef.gameState.addFuel(-properties.playerThrustConsumption);
  }

  _handleKeyPresses() {
    // debugPrint('onKeyEvent ${gameRef.pressedKeySet}');

    if (gameRef.pressedKeySet.contains(LogicalKeyboardKey.arrowLeft)) {
      angle -= rotationSpeed;
    } else if (gameRef.pressedKeySet.contains(LogicalKeyboardKey.arrowRight)) {
      angle += rotationSpeed;
    }

    if (gameRef.pressedKeySet.contains(LogicalKeyboardKey.arrowUp)) {
      _thrustShip(angle, gameRef.singlePlayer.properties.playerThrust);
    } else {
      _showThrust(false);
    }

    if (gameRef.pressedKeySet.contains(LogicalKeyboardKey.keyF)) {
      if (_canFireBullet) _fireBullet();
    }

    _showShield(gameRef.pressedKeySet.contains(LogicalKeyboardKey.space));

  }

  _showShield(bool shield) {
    if (shield) {
      _makeShieldSound();
      _shieldConsumePower();
      if (!_isShielding) {
        // debugPrint('Showing shields');
        add(_shieldComponent);
        _isShielding = true;
      }
    } else {
      shieldSoundThrottleCount = 0;
      if (_isShielding) {
        // debugPrint('Hiding shields');
        remove(_shieldComponent);
        _isShielding = false;
      }
    }
  }

  int shieldSoundThrottleCount = 0; // just throttling the shield not playing every frame
  _makeShieldSound() async {
    if (shieldSoundThrottleCount++ % 10 == 0) {
      debugPrint('makeShieldSound');
      gameRef.audio.playSfx(SfxType.shield);
    }
  }

  _shieldConsumePower() {
    gameRef.gameState.addFuel(-properties.playerShieldConsumption);
  }

  _showThrust(bool thrust) {
    if (thrust) {
      _makeThrustSound();
      if (!_isThrusting) {
        add(_thrustComponent);
        _isThrusting = true;
      }
    } else {
      if (_isThrusting) {
        remove(_thrustComponent);
        _isThrusting = false;
      }
    }
  }

  bool get _canFireBullet => fireTimeout <= 0;

  _fireBullet() {
    final rotationAngle = angle - pi / 2;
    final shipDirection = Vector2(cos(rotationAngle), sin(rotationAngle));
    final nosePoint = Vector2(-2, -2);
    gameRef.add(Bullet(
        radius: 2,
        velocityVector: velocity + shipDirection * properties.playerBulletSpeed,
        initialPosition: position + nosePoint,
        timeToLive: properties.playerBulletFireLifetimeSecs));

    fireTimeout = properties.playerBulletReloadSecs;

    _fireConsumePower();

    gameRef.audio.playSfx(SfxType.bullet);
  }

  _fireConsumePower() {
    gameRef.gameState.addFuel(-properties.playerFireConsumption);
  }

  int thrustThrottleCount = 0; // just throttling the thrust playing not every frame
  _makeThrustSound() {
    if (thrustThrottleCount++ % 9 == 0) {
      gameRef.audio.playSfx(SfxType.thrust);
    }
  }

  PlayerProperties get properties => gameRef.gameState.currentStarSystem.playerProperties;

  Gravity get gravity => gameRef.getGravity();

  double get angleToGravity => atan2(gravity.gravityCenter.x - position.x, gravity.gravityCenter.y - position.y);

  Vector2 get unitVectorToGravity => Vector2(sin(angleToGravity), cos(angleToGravity));

  Vector2 get vectorToGravity => unitVectorToGravity * gravity.gravityAmount;
}
