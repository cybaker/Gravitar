import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../style/palette.dart';
import '../player_game.dart';

///
/// The player view panel displays the number of lives left, remaining fuel, points
///
class PlayerHudView extends StatelessWidget {
  const PlayerHudView({required this.playerGame, Key? key})
      : super(key: key);

  final PlayerGame playerGame;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Column(
      children: [
        Row(
          children: [
            livesWidget(palette),
            spacer(),
            fuelWidget(palette),
            spacer(),
            scoreWidget(palette),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            missionStatusWidget(palette),
          ],
        ),
      ],
    );
  }

  Widget spacer() => Expanded(child: SizedBox(width: 20, height: 10,));

  ValueListenableBuilder<bool> missionStatusWidget(Palette palette) {
    return ValueListenableBuilder<bool>(
      valueListenable: playerGame.gameState.missionAccomplished,
      builder: (context, value, child) {
        if (value) return Text(
          'Mission Accomplished',
          style: palette.missionAccomplished,
          textAlign: TextAlign.center,
        );
        return const Text('');
      },
    );
  }

  ValueListenableBuilder<int> livesWidget(Palette palette) {
    return ValueListenableBuilder<int>(
        valueListenable: playerGame.gameState.remainingLives,
        builder: (context, value, child) {
          return Text(
            'Lives: $value',
            style: palette.subtitleSmall,
            textAlign: TextAlign.center,
          );
        },
      );
  }

  ValueListenableBuilder<double> fuelWidget(Palette palette) {
    return ValueListenableBuilder<double>(
        valueListenable: playerGame.gameState.remainingFuel,
        builder: (context, value, child) {
          return Text(
            'Fuel: ${value.toInt()}',
            style: palette.subtitleSmall,
            textAlign: TextAlign.center,
          );
        },
      );
  }

  ValueListenableBuilder<double> scoreWidget(Palette palette) {
    return ValueListenableBuilder<double>(
        valueListenable: playerGame.gameState.score,
        builder: (context, value, child) {
          return Text(
            'Score: $value',
            style: palette.subtitleSmall,
            textAlign: TextAlign.center,
          );
        },
      );
  }
}
