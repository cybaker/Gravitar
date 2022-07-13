// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ads/ads_controller.dart';
import '../ads/banner_ad_widget.dart';
import '../game/player_game.dart';
import '../games_services/score.dart';
import '../in_app_purchase/in_app_purchase.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class WinLevelScreen extends StatelessWidget {
  final PlayerGame game;

  const WinLevelScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    final adsControllerAvailable = context.watch<AdsController?>() != null;
    final adsRemoved =
        context.watch<InAppPurchaseController?>()?.adRemoval.active ?? false;
    final palette = context.watch<Palette>();

    const _gap = SizedBox(height: 10);

    var score = Score(game, game.gameState.duration!);

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (adsControllerAvailable && !adsRemoved) ...[
              const Expanded(
                child: Center(
                  child: BannerAdWidget(),
                ),
              ),
            ],
            _gap,
            Center(
              child: Text(
                'Level completed!',
                style: palette.title,
              ),
            ),
            _gap,
            Center(
              child: Text(
                'Enemies: ${game.gameState.score.value}\n'
                'Fuel: ${game.gameState.remainingFuel.value}\n'
                'Lives: ${game.gameState.remainingLives.value}\n'
                'Time: ${score.formattedTime}\n\n'
                'Score: ${score.score}\n',
                style: palette.subtitle,
              ),
            ),
          ],
        ),
        rectangularMenuArea: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
