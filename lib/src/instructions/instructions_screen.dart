// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/palette.dart';
import '../style/responsive_screen.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  static const _gap = SizedBox(height: 60);

  final String instructions = '''
The game has some levels of play: Normal gravity, Negative gravity, Normal gravity invisible, Negative gravity invisible
Each level consists of a star system with planets each of which need to be conquered. A level has fixed player and enemy properties like fire rate, gravity pull, etc.
In a planet there is ground, enemy bases, and fuel depots.

Tap play, select a level, and fly your ship to collect fuel and destroy enemy bases.
Use the arrow keys for movement:
- turn left (left arrow).
- turn right (right arrow).
- thrust (up arrow).
- fire (F)
- shield and fuel tractor beam (spacebar).
''';

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: ListView(
          children: [
            _gap,
            Text('Instructions', textAlign: TextAlign.center, style: palette.title,),
            _gap,
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(instructions, style: palette.subtitle,),
            ),
            _gap,
          ],
        ),
        rectangularMenuArea: ElevatedButton(
          child: const Text('Back'),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
    );
  }
}
