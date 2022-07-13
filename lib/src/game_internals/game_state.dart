// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:Gravitar/src/game/model/star_system.dart';
import 'package:flutter/foundation.dart';

import '../game/model/planet.dart';
import '../level_selection/levels.dart';

/// Game state
///
/// [playerLives]
/// [gameScreen] enum for Planet or StarSystem screen for a level
///
/// the value of [progress] reaches [playerLives].
class GameState extends ChangeNotifier{
  final VoidCallback onPlanetExit;
  final VoidCallback onStarSystemExit;
  final VoidCallback onUniverseExit;
  final GameUniverse universe;

  late StarSystem currentStarSystem;
  late Planet currentPlanet;
  var _PLAYER_LIVES = 6;
  var extraLifeTarget = 0;

  late final ValueNotifier<int> remainingLives = ValueNotifier<int>(_PLAYER_LIVES);
  late final ValueNotifier<double> score = ValueNotifier<double>(0);
  late final ValueNotifier<double> remainingFuel = ValueNotifier<double>(10000);
  late final ValueNotifier<bool> missionAccomplished = ValueNotifier<bool>(false);

  GameState({required this.onUniverseExit, required this.onStarSystemExit, required this.onPlanetExit, required this.universe}) {
    currentStarSystem = universe.starSystems[0];
    currentPlanet = currentStarSystem.planets[0];
    extraLifeTarget = universe.extraLifeThreshold;
  }

  int loseLife() {
    remainingLives.value--;
    if (remainingLives.value <= 0) {
      exitPlanet();
    }
    return remainingLives.value;
  }

  addFuel(double amount) {
    if (remainingFuel.value > 0) {
      remainingFuel.value += amount;
    } else {
      exitPlanet();
    }
  }

  void addScoreAndBumpLives(int points) {
    int prior = score.value ~/ extraLifeTarget;
    score.value += points;
    int post = score.value ~/ extraLifeTarget;
    if (post > prior) remainingLives.value++;
  }

  void exitPlanet() {
    if (allPlanetsConquered(currentStarSystem)) {
      onStarSystemExit();
    } else {
      onPlanetExit();
    }
  }

  bool allStarSystemsConquered() {
    var conquered = true;
    universe.starSystems.forEach((starSystem) {
        if (!allPlanetsConquered(starSystem)) {
          conquered = false;
        }
    });
    return conquered;
  }

  bool allPlanetsConquered(StarSystem starSystem) {
    var planets = starSystem.planets;
    var conquered = true;
    planets.forEach((planet) {
      if (planet.numEnemies != 0) {
        conquered = false;
      }
    });
    debugPrint("Conquered starsystem = $conquered");
    return conquered;
  }

  void gotoPlanet(Planet planet) {
    currentPlanet = planet;
    notifyListeners();
  }
}
