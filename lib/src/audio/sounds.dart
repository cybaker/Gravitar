// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.bullet:
      return const ['gravitar_shot.wav',];
    case SfxType.enemyBullet:
      return const ['gravitar_enemy_shot.wav', ];
    case SfxType.thrust:
      return const ['gravitar_thrust.wav',];
    case SfxType.enemyDestroyed:
      return const ['gravitar_explosion.wav',];
    case SfxType.fuelScooped:
      return const ['gravitar_fuel_pickup.wav',];
    case SfxType.shield:
      return const ['gravitar_shield.wav',];
    case SfxType.buttonTap:
      return const ['extraShip.wav',];
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.thrust:
      return 0.2;
    case SfxType.bullet:
    case SfxType.buttonTap:
      return 0.7;
    case SfxType.enemyBullet:
    case SfxType.shield:
      return 0.4;
    case SfxType.fuelScooped:
    case SfxType.enemyDestroyed:
      return 1.0;
  }
}

enum SfxType {
  buttonTap,
  bullet,
  thrust,
  shield,
  fuelScooped,
  enemyDestroyed,
  enemyBullet,
}
