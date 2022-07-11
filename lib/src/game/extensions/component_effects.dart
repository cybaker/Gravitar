import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../level_selection/levels.dart';

extension ComponentExtension on Component {
  void shake() {
    final effect = SequenceEffect([
      RotateEffect.by(0.2, EffectController(duration: 0.1, reverseDuration: 0.1, repeatCount: 2)),
      ScaleEffect.by(Vector2(1.1, 1.1), EffectController(duration: 0.1, reverseDuration: 0.1, repeatCount: 1)),
    ]);
    add(effect);
  }
}

extension PositionComponentExtension on PositionComponent {
  void keepWithinGameBounds(GameUniverse level) {
    if (position.x >= level.playfieldDimension) {
      position.x = -level.playfieldDimension + 10;
    } else if (position.x <= - level.playfieldDimension) {
      position.x = level.playfieldDimension -10;
    }
    if (position.y >= level.playfieldDimension) {
      position.y = -level.playfieldDimension + 10;
    } else if (position.y <= - level.playfieldDimension) {
      position.y = level.playfieldDimension -10;
    }
  }

  void setRandomPositionInside(double dimension) {
    var xExtent = Random().nextDouble()*dimension;
    var yExtent = Random().nextDouble()*dimension;
    position = Vector2(
      Random().nextBool() ? xExtent : -xExtent,
      Random().nextBool() ? yExtent : -yExtent,
    );
  }

  void setRandomPositionBetween(double outside, double inside) {
    if(outside < inside) {
      position = Vector2(0, 0);
    } else {
      var xExtent = inside + Random().nextDouble()*(outside - inside);
      var yExtent = inside + Random().nextDouble()*(outside - inside);
      position = Vector2(
        Random().nextBool() ? xExtent : -xExtent,
        Random().nextBool() ? yExtent : -yExtent,
      );
    }
  }

  Vector2 randomPlusMinusWithin(double maxSpeed) {
    return Vector2(randomFromTo(-maxSpeed, maxSpeed), randomFromTo(-maxSpeed, maxSpeed));
  }

  double randomFromTo(double minValue, double maxValue) {
    return (Random().nextDouble() * (maxValue - minValue) + minValue);
  }

  /// true if less than percent, false otherwise
  /// [percent] from 0 to 100
  bool randomPercentOfTime(int percent) {
    return Random().nextInt(100) < percent;
  }
}