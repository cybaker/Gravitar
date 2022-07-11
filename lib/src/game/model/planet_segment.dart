import 'package:flame/game.dart';

import '../components/segment_component.dart';

///
/// The planet segment is a line with enemy bases and or fuel depots attached as components
///
///         base            base
/// ----------------------------------------...
///                fuel            fuel
///
/// bases are shown above the line, fuel depots below. The line position starts from either 0,0 or
/// the last planet segment endpoint.
/// The edge has a 0 to 2*pi angle depending on the [positionStart] and [positionEnd].
/// [segmentComponents] may be empty, or describe a List<EdgeComponent> attached to this edge.

class PlanetSegment {
  PlanetSegment({required this.positionEnd, required this.segmentComponents});

  final Vector2 positionEnd;
  final List<SegmentComponent> segmentComponents;
}
