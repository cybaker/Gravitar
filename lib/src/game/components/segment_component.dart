import 'package:Gravitar/src/game/player_game.dart';
import 'package:flame/components.dart';

///
/// The edge component is the base polygon component that attaches to an edge
/// This needs a [relativeAnchorLength] double that describes how far along
/// this component is placed, from 0.0, beginning of segment, to 1.0, end of segment.
/// The default is halfway along the edge.
/// Subclasses are base and fuel.
///
class SegmentComponent extends PolygonComponent with HasGameRef<PlayerGame>{
  SegmentComponent({required this.shapeVertices, this.relativeAnchorLength = 0.5}) :
        super(shapeVertices, priority: 3,);

  /// The vertices describing the shape
  final List<Vector2> shapeVertices;

  final double relativeAnchorLength;
}