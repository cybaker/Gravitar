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

  final fireShieldHeight = 150.0;

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
          joystickWidget(),
          Spacer(flex: 10),
          GestureDetector(
            onPanStart: (updateDetails) {
              fireShieldInput(updateDetails.localPosition);
            },
            onPanUpdate: (updateDetails) {
              fireShieldInput(updateDetails.localPosition);
            },
            onPanEnd: (updateDetails) {
              fireShieldInput(Offset.zero);
            },
            child: fireShieldWidget(),
          ),
        ],
      );
  }

  Widget fireShieldWidget() {
    return Stack(
      children: [
        Container(
          height: fireShieldHeight,
          width:100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(fireShieldHeight/2)),
            gradient:LinearGradient(
                colors: [
                  Colors.green,
                  Colors.greenAccent,
                  Colors.lightBlue,
                  Colors.blue,
                  //add more colors for gradient
                ],
                begin: Alignment.topCenter, //begin of the gradient color
                end: Alignment.bottomCenter, //end of the gradient color
                stops: [0, 0.4, 0.6, 1.0] //stops for individual color
              //set the stops number equal to numbers of color
            ),
          ),
        ),
        Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(16),
                    child: Text("FIRE")))
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("SHIELD")))
        ),
      ]

    );
  }

  void fireShieldInput(Offset offset) {
    if (offset == Offset.zero || offset.dx < 0.0 || offset.dx > fireShieldHeight ||
        offset.dy < 0.0 || offset.dy > fireShieldHeight) {
      playerGame.singlePlayer.setContinuousFiring(false);
      playerGame.singlePlayer.setContinuousShielding(false);
    } else if (offset.dy < fireShieldHeight/3) {
      playerGame.singlePlayer.setContinuousFiring(true);
      playerGame.singlePlayer.setContinuousShielding(false);
    } else if (offset.dy > 2*fireShieldHeight/3){
      playerGame.singlePlayer.setContinuousFiring(false);
      playerGame.singlePlayer.setContinuousShielding(true);
    } else {
      playerGame.singlePlayer.setContinuousFiring(true);
      playerGame.singlePlayer.setContinuousShielding(true);
    }
  }

  Joystick joystickWidget() {
    return Joystick(
          mode: JoystickMode.all,
          listener: (details) {
            // debugPrint("Joystick details = ${details.x}");
            playerGame.singlePlayer.setJoystickVector(details.x, details.y);
          }
      );
  }

  Widget spacer() => Expanded(child: SizedBox(width: 20, height: 10,));

  ValueListenableBuilder<bool> missionStatusWidget(Palette palette) {
    return ValueListenableBuilder<bool>(
      valueListenable: playerGame.gameState.missionAccomplished,
      builder: (context, value, child) {
        if (value) return Text(
          'Mission Accomplished',
          style: kIsWeb ? palette.missionAccomplished : palette.missionAccomplishedMobile,
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
            style: kIsWeb ? palette.title : palette.titleMobile,
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
            style: kIsWeb ? palette.title : palette.titleMobile,
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
            style: kIsWeb ? palette.title : palette.titleMobile,
            textAlign: TextAlign.center,
          );
        },
      );
  }
}
