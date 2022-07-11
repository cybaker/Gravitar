// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';
import 'levels.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

    debugPrint('LevelSelectionScreen highestScore = ${playerProgress.highestScoreReached}, highestLevel = ${playerProgress.highestLevelReached}');

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Select level',
                  style: palette.title,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Total Score: ${playerProgress.highestScoreReached}',
                  style: palette.subtitle,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  for (final level in gameLevels)
                    ListTile(
                      enabled: playerProgress.highestLevelReached >= level.level - 1,
                      onTap: () {
                        final audioController = context.read<AudioController>();
                        audioController.playSfx(SfxType.buttonTap);

                        GoRouter.of(context).go('/play/session/${level.level}');
                      },
                      leading: Text(level.level.toString(), style: enabledDisabledStyle(playerProgress, level, palette)),
                      title: Text('${level.name}', style: enabledDisabledStyle(playerProgress, level, palette)),
                    )
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text('Back'),
        ),
      ),
    );
  }

  TextStyle enabledDisabledStyle(PlayerProgress playerProgress, GameUniverse level, Palette palette) {
    return playerProgress.highestLevelReached >= level.level - 1 ?
                        palette.subtitle : palette.subtitleDisabled;
  }
}
