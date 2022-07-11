// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../in_app_purchase/in_app_purchase.dart';
import '../player_progress/player_progress.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';
import 'custom_name_dialog.dart';
import 'settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: ListView(
          children: [
            _gap,
            Text(
              'Settings',
              textAlign: TextAlign.center,
              style: palette.title,
            ),
            _gap,
            const _NameChangeLine(
              'Name',
            ),
            ValueListenableBuilder<bool>(
              valueListenable: settings.sfxOn,
              builder: (context, soundsOn, child) => _SettingsLine(
                'Sound FX',
                Icon(soundsOn ? Icons.graphic_eq : Icons.volume_off, color: palette.pen,),
                onSelected: () => settings.toggleSoundsOn(),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: settings.backgroundMusicOn,
              builder: (context, musicOn, child) => _SettingsLine(
                'Background music',
                Icon(musicOn ? Icons.music_note : Icons.music_off, color: palette.pen,),
                onSelected: () => settings.toggleMusicOn(),
              ),
            ),
            Consumer<InAppPurchaseController?>(
                builder: (context, inAppPurchase, child) {
              if (inAppPurchase == null) {
                // In-app purchases are not supported yet.
                // Go to lib/main.dart and uncomment the lines that create
                // the InAppPurchaseController.
                return const SizedBox.shrink();
              }

              Widget icon;
              VoidCallback? callback;
              if (inAppPurchase.adRemoval.active) {
                icon = const Icon(Icons.check);
              } else if (inAppPurchase.adRemoval.pending) {
                icon = const CircularProgressIndicator();
              } else {
                icon = const Icon(Icons.ad_units);
                callback = () {
                  inAppPurchase.buy();
                };
              }
              return _SettingsLine(
                'Remove ads',
                icon,
                onSelected: callback,
              );
            }),
            _SettingsLine(
              'Reset progress',
              Icon(Icons.delete,  color: palette.pen,),
              onSelected: () {
                context.read<PlayerProgress>().reset();

                final messenger = ScaffoldMessenger.of(context);
                messenger.showSnackBar(
                  const SnackBar(
                      content: Text('Player progress has been reset.')),
                );
              },
            ),
            _gap,
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
}

class _NameChangeLine extends StatelessWidget {
  final String title;

  const _NameChangeLine(this.title);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final palette = context.watch<Palette>();

    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: () => showCustomNameDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: palette.subtitle),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: settings.playerName,
              builder: (context, name, child) => Text(
                '‘$name’',
                style: palette.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsLine extends StatelessWidget {
  final String title;

  final Widget icon;

  final VoidCallback? onSelected;

  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: palette.subtitle),
            const Spacer(),
            icon,
          ],
        ),
      ),
    );
  }
}
