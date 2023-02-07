// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:Gravitar/main.dart';
import 'package:Gravitar/src/player_progress/persistence/memory_player_progress_persistence.dart';
import 'package:Gravitar/src/settings/persistence/memory_settings_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('smoke test', (tester) async {

    // Build our game and trigger a frame.
    await tester.pumpWidget(GravitarApp(
      settingsPersistence: MemoryOnlySettingsPersistence(),
      playerProgressPersistence: MemoryOnlyPlayerProgressPersistence(),
      gamesServicesController: null,
    ));

    final NavigatorState navigator = tester.state(find.byType(Navigator));

    // Verify that the main screen buttons show.
    expect(find.text('Play'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    // expect(find.text('Instructions'), findsOneWidget);

    // Tap 'Play'.
    await tester.tap(find.text('Play'));
    await tester.pumpAndSettle();
    expect(find.text('Select level'), findsOneWidget);

    // Go back to main menu.
    navigator.pop();
    await tester.pumpAndSettle();

    // Go to 'Settings'.
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('Background music'), findsOneWidget);

    // // Go back to main menu.
    // navigator.pop();
    // await tester.pumpAndSettle();
    //
    // // Go to 'Settings'.
    // await tester.tap(find.text('Instructions'));
    // await tester.pumpAndSettle();
    // expect(find.text('Instructions'), findsOneWidget);

    // Tap top level.
    // await tester.tap(find.textContaining('Beginner').first);
    // await tester.pump();

    // Find the first level's text.
    // expect(find.textContaining('Lives'), findsOneWidget);
  });
}
