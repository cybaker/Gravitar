// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/game/view/planet_view.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'src/game/player_game.dart';
import 'src/app_lifecycle/app_lifecycle.dart';
import 'src/audio/audio_controller.dart';
import 'src/crashlytics/crashlytics.dart';
import 'src/games_services/games_services.dart';
import 'src/games_services/score.dart';
import 'src/instructions/instructions_screen.dart';
import 'src/level_selection/level_selection_screen.dart';
import 'src/level_selection/levels.dart';
import 'src/main_menu/main_menu_screen.dart';
import 'src/player_progress/persistence/local_storage_player_progress_persistence.dart';
import 'src/player_progress/persistence/player_progress_persistence.dart';
import 'src/player_progress/player_progress.dart';
import 'src/settings/persistence/local_storage_settings_persistence.dart';
import 'src/settings/persistence/settings_persistence.dart';
import 'src/settings/settings.dart';
import 'src/settings/settings_screen.dart';
import 'src/style/my_transition.dart';
import 'src/style/palette.dart';
import 'src/style/snack_bar.dart';
import 'src/win_game/lose_level_screen.dart';
import 'src/win_game/win_level_screen.dart';

Future<void> main() async {
  // Uncomment the following lines to enable Firebase Crashlytics.
  // See lib/src/crashlytics/README.md for details.

  FirebaseCrashlytics? crashlytics;
  // if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     );
  //     crashlytics = FirebaseCrashlytics.instance;
  //   } catch (e) {
  //     debugPrint("Firebase couldn't be initialized: $e");
  //   }
  // }

  await guardWithCrashlytics(
    guardedMain,
    crashlytics: crashlytics,
  );
}

/// Without logging and crash reporting, this would be `void main()`.
void guardedMain() {
  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  // TODO: When ready, uncomment the following lines to enable integrations.
  //       Read the README for more info on each integration.

  GamesServicesController? gamesServicesController;
  // if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
  //   gamesServicesController = GamesServicesController()
  //     // Attempt to log the player in.
  //     ..initialize();
  // }


  runApp(
    GravitarApp(
      settingsPersistence: LocalStorageSettingsPersistence(),
      playerProgressPersistence: LocalStoragePlayerProgressPersistence(),
      gamesServicesController: gamesServicesController,
    ),
  );
}

Logger _log = Logger('main.dart');

class GravitarApp extends StatelessWidget {
  static final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) =>
              const MainMenuScreen(key: Key('main menu')),
          routes: [
            GoRoute(
                path: 'play',
                pageBuilder: (context, state) => buildMyTransition(
                      child: const LevelSelectionScreen(
                          key: Key('level selection')),
                      color: context.watch<Palette>().backgroundLevelSelection,
                    ),
                routes: [
                  GoRoute(
                    path: 'session/:level',
                    pageBuilder: (context, state) {
                      final levelNumber = int.parse(state.params['level']!);
                      final gameLevel = gameUniverses
                          .singleWhere((e) => e.level == levelNumber);
                      return buildMyTransition(
                        child: PlanetView(
                          key: Key('play session $levelNumber'),
                          universe: gameLevel,
                        ),
                        color: context.watch<Palette>().backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'won',
                    pageBuilder: (context, state) {
                      final map = state.extra! as Map<String, dynamic>;
                      final game = map['game'] as PlayerGame;

                      return buildMyTransition(
                        child: WinLevelScreen(
                          game: game,
                          key: const Key('win level'),
                        ),
                        color: context.watch<Palette>().backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'lost',
                    pageBuilder: (context, state) {
                      final map = state.extra! as Map<String, dynamic>;
                      final score = map['score'] as Score;

                      return buildMyTransition(
                        child: LoseLevelScreen(
                          score: score,
                          key: const Key('lost level'),
                        ),
                        color: context.watch<Palette>().backgroundPlaySession,
                      );
                    },
                  ),
                ]),
            GoRoute(
              path: 'settings',
              builder: (context, state) =>
                  const SettingsScreen(key: Key('settings')),
            ),
            GoRoute(
              path: 'instructions',
              builder: (context, state) =>
              const InstructionsScreen(key: Key('instructions')),
            ),
          ]),
    ],
  );

  final PlayerProgressPersistence playerProgressPersistence;

  final SettingsPersistence settingsPersistence;

  final GamesServicesController? gamesServicesController;

  const GravitarApp({
    required this.playerProgressPersistence,
    required this.settingsPersistence,
    required this.gamesServicesController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              var progress = PlayerProgress(playerProgressPersistence);
              progress.getHighestLevelFromStore();
              return progress;
            },
          ),
          Provider<GamesServicesController?>.value(
              value: gamesServicesController),
          Provider<SettingsController>(
            lazy: false,
            create: (context) => SettingsController(
              persistence: settingsPersistence,
            )..loadStateFromPersistence(),
          ),
          ProxyProvider2<SettingsController, ValueNotifier<AppLifecycleState>,
              AudioController>(
            // Ensures that the AudioController is created on startup,
            // and not "only when it's needed", as is default behavior.
            // This way, music starts immediately.
            lazy: false,
            create: (context) => AudioController()..initialize(),
            update: (context, settings, lifecycleNotifier, audio) {
              if (audio == null) throw ArgumentError.notNull();
              audio.attachSettings(settings);
              audio.attachLifecycleNotifier(lifecycleNotifier);
              return audio;
            },
            dispose: (context, audio) => audio.dispose(),
          ),
          Provider(
            create: (context) => Palette(),
          ),
        ],
        child: Builder(builder: (context) {
          final palette = context.watch<Palette>();

          return MaterialApp.router(
            title: 'Gravitar',
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: palette.darkPen,
                background: palette.backgroundMain,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: palette.ink,
                ),
              ),
            ),
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            scaffoldMessengerKey: scaffoldMessengerKey,
          );
        }),
      ),
    );
  }
}
