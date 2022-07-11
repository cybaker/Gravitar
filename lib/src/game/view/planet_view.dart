import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../../audio/audio_controller.dart';
import '../../game_internals/game_state.dart';
import '../../games_services/games_services.dart';
import '../../games_services/score.dart';
import '../../level_selection/levels.dart';
import '../../player_progress/player_progress.dart';
import '../player_game.dart';
import '../player/player_hud_view.dart';

///
/// View of a single planet
///
class PlanetView extends StatefulWidget {
  const PlanetView({Key? key, required this.universe}) : super(key: key);

  final GameUniverse universe;

  @override
  State<PlanetView> createState() => PlanetViewState();
}

class PlanetViewState extends State<PlanetView> {
  late FocusNode _gameFocusNode;

  static final _log = Logger('PlanetViewScreen');

  static const _celebrationDuration = Duration(milliseconds: 0);

  static const _preCelebrationDuration = Duration(milliseconds: 500);

  late DateTime _startOfPlay;

  late GameState _gameState;

  late PlayerGame _playerGame;

  late GameWidget _gameWidget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _gameState = GameState(onUniverseExit: _playerExitedUniverse, onStarSystemExit: _playerExitedStarSystem, onPlanetExit: _playerExitedPlanet, universe: widget.universe);

    _playerGame = PlayerGame(universe: widget.universe, gameState: _gameState, audio: context.read<AudioController>());

    _startOfPlay = DateTime.now();

    _gameFocusNode = FocusNode();

    _gameWidget = GameWidget<PlayerGame>(
      focusNode: _gameFocusNode,
      game: _playerGame,
    );
  }

  @override
  void dispose() {
    _gameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => _gameState,
          ),
        ],
        child: Scaffold(
          body: Stack(
            children: [
              MouseRegion(
                  onHover: (_) {
                    if (!_gameFocusNode.hasFocus) {
                      _gameFocusNode.requestFocus();
                    }
                  },
                  child: _gameWidget,
                ),
              Padding(
                padding: EdgeInsets.all(16),
                child: PlayerHudView(
                  playerGame: _playerGame,
                ),
              ),
            ],
          ),
        ));
  }

  // TBD
  Future<void> _playerWonLevel() async {
    _log.info('Level ${widget.universe.level} won');
    debugPrint('GameView.playerWonLevel ${widget.universe.level}');

    resetUniverse();

    var score = getScore();

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(widget.universe.level);
    var oldProgress = await playerProgress.getTotalScore();
    playerProgress.setTotalScoreReached(score.score.toDouble() + oldProgress);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    // final audioController = context.read<AudioController>();
    // audioController.playSfx(SfxType.congrats);

    final gamesServicesController = context.read<GamesServicesController?>();
    if (gamesServicesController != null) {
      // Award achievement.
      if (widget.universe.awardsAchievement) {
        await gamesServicesController.awardAchievement(
          android: widget.universe.achievementIdAndroid!,
          iOS: widget.universe.achievementIdIOS!,
        );
      }

      // Send score to leaderboard.
      await gamesServicesController.submitLeaderboardScore(score);
    }

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).pop();
    GoRouter.of(context).go('/play/won', extra: {'score': score});
  }

  Future<void> _playerExitedUniverse() async {
    debugPrint('_playerExitedUniverse');
  }

  Future<void> _playerExitedStarSystem() async {
    var conquered = _gameState.allPlanetsConquered(_gameState.currentStarSystem);
    debugPrint('_playerExitedStarSystem all star system planets conquered = $conquered');
    if (conquered) {
      _playerWonLevel();
    } else {
      enterPlanet();
    }
  }

  Score getScore() {
    return Score(
      _playerGame,
      DateTime.now().difference(_startOfPlay),
    );
  }

  Future<void> _playerExitedPlanet() async {
    debugPrint('PlanetView.playerExitedPlanet');

    if (_gameState.remainingLives.value <= 0) {
      _playerLost();
    } else {
      playerReenterExistingStarSystem();
    }
  }

  void _playerLost() {
    Score getScore() {
      return Score(
        _playerGame,
        DateTime.now().difference(_startOfPlay),
      );
    }

    _log.info('Level ${widget.universe.level} lost');
    resetUniverse();
    GoRouter.of(context).pop();
    GoRouter.of(context).go('/play/lost', extra: {'score': getScore()});
  }

  void resetUniverse() {
    widget.universe.starSystems.forEach((starSystem) {
      starSystem.planets.forEach((planet) {
        debugPrint('Resetting numEnemies for ${planet.starSystemPosition}');
        planet.numEnemies = -1;
      });
    });
  }

  void playerReenterExistingStarSystem() {
    _playerGame.missionAccomplished.value = false;
    _gameState.currentStarSystem.currentWarpInPosition = _gameState.currentPlanet.numEnemies == 0 ?
      _gameState.currentPlanet.starSystemPosition : _gameState.currentStarSystem.startWarpInPosition;
    _playerGame.loadStarSystem();
  }

  void enterPlanet() {
    _playerGame.missionAccomplished.value = false;
    _playerGame.loadPlanet();
  }
}
