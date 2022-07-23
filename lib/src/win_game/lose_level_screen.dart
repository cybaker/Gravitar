// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../games_services/score.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class LoseLevelScreen extends StatelessWidget {
  final Score score;

  const LoseLevelScreen({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    const _gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Level Lost! No points for you!',
                style: palette.title,
              ),
            ),
            _gap,
            Center(
              child: Text(
                'Score: ${score.score}\n'
                'Time: ${score.formattedTime}',
                style: palette.subtitle,
              ),
            ),
          ],
        ),
        rectangularMenuArea: ElevatedButton(
          child: const Text('Continue'),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
    );
  }
}
