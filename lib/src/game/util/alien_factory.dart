
import 'dart:math';

import 'package:flame/components.dart';

import '../../level_selection/levels.dart';
import '../extensions/component_effects.dart';
import '../components/base_enemy.dart';
import '../player/player.dart';
import '../player_game.dart';

class AlienFactory extends Component
    with HasGameRef<PlayerGame> {
  AlienFactory({required this.player}) : super(priority: 5);

  final Player player;

  double futureSpawnTime = 0;

  double get randomSpawnTime => enemyBaseProperties.averageFireTimeSec*(0.5 + Random().nextDouble());

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    futureSpawnTime = randomSpawnTime;
  }

  @override
  void update(double dt) {
    futureSpawnTime -= dt;
    if(futureSpawnTime < 0) spawnRandomEnemy();
  }

  void spawnRandomEnemy() {
    gameRef.add(makeRandomEnemy());
    futureSpawnTime = randomSpawnTime;
  }

  PositionComponent makeRandomEnemy() {
    var enemy = EnemyBaseComponent();
    enemy.setRandomPositionBetween(gameRef.universe.playfieldDimension.toDouble(), 6*gameRef.universe.playfieldDimension/8);
    return enemy;
  }
}

