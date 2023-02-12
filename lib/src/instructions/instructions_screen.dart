// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/palette.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  static const _gap = SizedBox(height: 60);
  static const _gapMobile = SizedBox(height: 10);

  final String instructions = '''
The game has some levels of increasingly challenging play.
Each level consists of a star system with planets each of which need to be conquered by defeating all enemies.
In a planet there are ground, enemy bases, and fuel depots.
Fly your space ship but avoid hitting ground, enemy bases, and the reactor.
Use your shield / tractor beam to collect fuel and avoid hits by enemies.
Your space ship consumes fuel when maneuvering, firing, and shielding. Keep collecting fuel.

Use the arrow keys for movement:
- turn left (left arrow).
- turn right (right arrow).
- thrust (up arrow).
- fire bullets (F).
- fire laser (D). This consumes more fuel than bullets.
- shield and fuel tractor beam (spacebar).

Tap the mouse pointer to pause the game.
''';

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ListView(
          children: [
            kIsWeb ? _gap : _gapMobile,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Instructions', textAlign: TextAlign.center, style: palette.title,),
                  kIsWeb ? _backWidget(context) : Container(),
                ],
              ),
            kIsWeb ? _gap : Container(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(instructions, style: palette.subtitle,),
            ),
            _gap,
          ],
        ),
      );
  }

  Widget _backWidget(BuildContext context) {
    return ElevatedButton(
        child: const Text('Back'),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      );
  }
}
