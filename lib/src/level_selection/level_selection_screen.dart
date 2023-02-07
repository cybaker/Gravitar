// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
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
            _titleWidget(palette),
            _gap(),
            _levelsListWidget(playerProgress, context, palette),
          ],
        ),
        rectangularMenuArea: Column(
          children: [
            _totalScoreWidget(playerProgress, palette),
            _gap(),
            kIsWeb ? _backWidget(context) : Container(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _backWidget(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          GoRouter.of(context).push('/');
        },
        child: const Text('Back'),
      );
  }

  Expanded _levelsListWidget(PlayerProgress playerProgress, BuildContext context, Palette palette) {
    return Expanded(
            child: ListView(
              children: [
                for (final universe in gameUniverses)
                  ListTile(
                    enabled: enabled(playerProgress, universe),
                    onTap: () {
                      final audioController = context.read<AudioController>();
                      audioController.playSfx(SfxType.buttonTap);

                      GoRouter.of(context).push('/play/session/${universe.level}');
                    },
                    leading: Text(universe.level.toString(), style: enabledDisabledStyle(playerProgress, universe, palette)),
                    title: Text('${universe.name}', style: enabledDisabledStyle(playerProgress, universe, palette)),
                  )
              ],
            ),
          );
  }

  Padding _totalScoreWidget(PlayerProgress playerProgress, Palette palette) {
    return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Total Score: ${playerProgress.highestScoreReached}',
                style: palette.subtitle,
              ),
            ),
          );
  }

  Padding _titleWidget(Palette palette) {
    return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Select level',
                style: palette.title,
              ),
            ),
          );
  }

  SizedBox _gap() => kIsWeb ? SizedBox(height: 50) : SizedBox(height: 0,);


  bool enabled(PlayerProgress playerProgress, GameUniverse universe) {
    return playerProgress.highestLevelReached >= universe.level - 1;
  }

  TextStyle enabledDisabledStyle(PlayerProgress playerProgress, GameUniverse universe, Palette palette) {
    TextStyle responsiveTitle = kIsWeb ? palette.subtitle : palette.subtitleMobile;
    TextStyle responsiveTitleDisabled = kIsWeb ? palette.subtitleDisabled : palette.subtitleMobileDisabled;
    return enabled(playerProgress, universe) ? responsiveTitle : responsiveTitleDisabled;
  }
}
