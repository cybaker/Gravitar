import 'package:flame/components.dart';

/// Gravity has a center (might be very far away like 100,000), and a pull amount to the center
class Gravity {
  Gravity({
    required this.gravityCenter,
    this.gravityAmount = 0.1,
  });

  final Vector2 gravityCenter;
  final double gravityAmount;
}
