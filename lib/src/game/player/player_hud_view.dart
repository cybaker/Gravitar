import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        if ((defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android)) touchControls(),
      ],
    );
  }

  Widget touchControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Joystick(
            mode: JoystickMode.all,
            listener: (details) {
              // debugPrint("Joystick details = ${details.x}");
              playerGame.singlePlayer.setJoystickVector(details.x, details.y);
            }
        ),
        Spacer(flex: 19),
        InkWell(
          child: Icon(Icons.radio_button_checked, color: Colors.blue, size: 80,),
          onTapDown: (_) => playerGame.singlePlayer.setContinuousFiring(true),
          onTapCancel: () => playerGame.singlePlayer.setContinuousFiring(false),
          onTap: () => playerGame.singlePlayer.setContinuousFiring(false),
        ),
        InkWell(
          child: Icon(Icons.radio_button_checked, color: Colors.blue, size: 80,),
          onTapDown: (_) => playerGame.singlePlayer.setContinuousShielding(true),
          onTapCancel: () => playerGame.singlePlayer.setContinuousShielding(false),
          onTap: () => playerGame.singlePlayer.setContinuousShielding(false),
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
            style: palette.title,
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
            style: palette.title,
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
            style: palette.title,
            textAlign: TextAlign.center,
          );
        },
      );
  }
}
