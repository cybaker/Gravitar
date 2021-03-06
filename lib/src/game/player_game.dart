import 'dart:async';

import 'package:Gravitar/src/game_internals/game_state.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../src/audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../level_selection/levels.dart';
import 'components/explosion.dart';
import 'model/gravity.dart';
import 'player/player.dart';

final Map<LogicalKeyboardKey, LogicalKeyboardKey> playersKeys = {
  LogicalKeyboardKey.keyA: LogicalKeyboardKey.keyA,
  LogicalKeyboardKey.keyS: LogicalKeyboardKey.keyS,
  LogicalKeyboardKey.keyL: LogicalKeyboardKey.keyL,
  LogicalKeyboardKey.keyK: LogicalKeyboardKey.keyK,
  LogicalKeyboardKey.space: LogicalKeyboardKey.space,
};

class PlayerGame extends FlameGame with KeyboardEvents, HasCollisionDetection, TapDetector {
  PlayerGame({required this.universe, required this.gameState, required this.audio});

  /// relative to level.playfieldDimension
  static const double playerEntersAtX = 0.5;
  static const double playerEntersAtY = 0.05;

  static const double zoomOutFullyY = 0.05;
  static const double zoomInFullyY = 0.1;

  static const double zoomOut = 0.5;
  static const double zoomIn = 2.0;

  final GameUniverse universe;
  final GameState gameState;
  final AudioController audio;

  late Set<LogicalKeyboardKey> pressedKeySet;
  bool isGameOver = false;
  bool isGameStarSystem = true;

  late Player singlePlayer = Player(); // Global only one player
  late Vector2 planetPlayerEntryPoint = Vector2(universe.playfieldDimension * playerEntersAtX, universe.playfieldDimension * playerEntersAtY);

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    pressedKeySet = {};

    final Vector2 resolution = Vector2(universe.playfieldDimension.toDouble(), universe.playfieldDimension.toDouble());
    camera.viewport = FixedResolutionViewport(resolution);

    // loadPlanet();
    loadStarSystem();
  }

  void loadStarSystem() async {
    removeAll(this.children);
    isGameStarSystem = true;
    Timer(Duration(milliseconds: 35), _continueLoadStarSystem);
  }

  Future<void> _continueLoadStarSystem() async {
    await addStarSystemComponents();
    await addPlayerAndFollow();
    singlePlayer.position = gameState.currentStarSystem.currentWarpInPosition;
    if (gameState.currentStarSystem.currentWarpInPosition == gameState.currentPlanet.starSystemPosition &&
        gameState.currentPlanet.numEnemies == 0) {
        await add(planetExplosion(gameState.currentStarSystem.currentWarpInPosition));
        audio.playSfx(SfxType.enemyDestroyed);
    }
  }

  Future<void> addStarSystemComponents() async {
    var currentStarSystem = gameState.currentStarSystem;
    await addAll(currentStarSystem.unconqueredStarSystemComponents());
  }

  void loadPlanet() async {
    removeAll(this.children);
    isGameStarSystem = false;
    Timer(Duration(milliseconds: 35), _continueLoadPlanet);
  }

  Future<void> _continueLoadPlanet() async {
    await addPlanetComponents();
    await addPlayerAndFollow();
    singlePlayer.position = planetPlayerEntryPoint;
  }

  Future<void> addPlanetComponents() async {
    var currentPlanet = gameState.currentPlanet;
    await addAll(currentPlanet.planetPolygonShapes());
    await addAll(currentPlanet.planetComponents());
    await addAll(currentPlanet.planetExits);
  }

  void playerHit() async {
    audio.playSfx(SfxType.enemyDestroyed);
    if (gameState.loseLife() > 0) {
      respawnInPlanet();
    } else {
      exitPlanet();
    }
  }

  void exitPlanet() {
    this.removeAll(this.children);
    Timer(Duration(milliseconds: 35), () => { gameState.exitPlanet()});
  }

  void respawnInPlanet() {
    remove(singlePlayer);
    add(shipExplosion(singlePlayer.position));
    Timer(Duration(seconds: 2), addPlayerAndFollow);
  }

  void enemyDestroyed() async {
    gameState.currentPlanet.numEnemies--;
    if (gameState.currentPlanet.numEnemies <= 0) {
      gameState.missionAccomplished.value = true;
    }
  }

  Future<void> addPlayerAndFollow() async {
    await add(singlePlayer
      ..angle = 0
      ..velocity = Vector2.zero());
    singlePlayer.position = planetPlayerEntryPoint;

    camera.followComponent(singlePlayer);
  }

  Gravity getGravity() {
    return isGameStarSystem ? gameState.currentStarSystem.gravity : gameState.currentPlanet.gravity;
  }

  cameraZoom() {
    if (isGameStarSystem) {
      camera.zoom = 1.0;
    } else {
      var playerNormalizedHeight = singlePlayer.position.y / universe.playfieldDimension;
      if (playerNormalizedHeight > zoomInFullyY) {
        // zoom in maximum
        return camera.zoom = zoomIn;
      } else if (playerNormalizedHeight < zoomOutFullyY) {
        // zoom out maximum
        camera.zoom = zoomOut;
      } else {
        var zoom =
            zoomOut + (zoomIn - zoomOut) * (playerNormalizedHeight - zoomOutFullyY) / (zoomInFullyY - zoomOutFullyY);
        camera.zoom = zoom;
      }
    }
    // debugPrint('Camera zoom: ${camera.zoom}');
  }

  /*
    This allows continuous key pressing for a real keyboard
   */
  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);
    if (!isLoaded || isGameOver) {
      return KeyEventResult.ignored;
    }

    pressedKeySet.clear();
    for (var key in keysPressed) {
      pressedKeySet.add(key);
    }
    return KeyEventResult.handled;
  }

  @override
  void onTap() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
  }
}
