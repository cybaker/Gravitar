import 'dart:math';

extension ListExtension on List {
  static Random random = Random();

  /// Returns a random element from a given list
  randomElement() {
    return this[random.nextInt(this.length)];
  }
}