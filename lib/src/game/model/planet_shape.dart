
import 'package:flame/game.dart';

import 'planet_segment.dart';

///
/// PlanetShape has an offset and collection of planet segments
///
class PlanetShape {
  PlanetShape({required this.offset, required this.segments});

  final Vector2 offset;
  final List<PlanetSegment> segments;
}
