import 'dart:math';

import 'package:Gravitar/src/game/components/base_enemy.dart';
import 'package:Gravitar/src/game/components/planet_exit.dart';
import 'package:Gravitar/src/game/components/planet_polygon.dart';
import 'package:Gravitar/src/game/components/reactor.dart';
import 'package:flame/components.dart';

import '../components/segment_component.dart';
import '../model/planet_shape.dart';
import 'gravity.dart';

///
/// A planet has bases and flying enemies and fuel depots.
/// A planet has an image and location in a star system.
///
class Planet {
  Planet({
    required this.imageFilename,
    required this.starSystemPosition,
    required this.starSystemSize,
    required this.gravity,
    required this.planetShapes,
    required this.planetExits,
  });

  final String imageFilename;
  final Vector2 starSystemPosition;
  final Vector2 starSystemSize;

  final Gravity gravity;

  final List<PlanetShape> planetShapes;
  final List<PlanetExitComponent> planetExits;

  var numEnemies = -1; // -1 is uninitialized

  List<PlanetPolygon> planetPolygonShapes() {
    List<PlanetPolygon> planetPolygons = [];

    planetShapes.forEach((planetShape) {
      List<Vector2> polygonList = [];
      planetShape.segments.forEach((element) {
        polygonList.add(element.positionEnd);
      });
      planetPolygons.add(PlanetPolygon(verticesList: polygonList, offset: planetShape.offset));
    });

    return planetPolygons;
  }

  List<SegmentComponent> planetComponents() {
    var numberEnemies = 0;
    List<SegmentComponent> components = [];
    planetShapes.forEach((planetShape) {
      Vector2 startOfLine = Vector2.zero();
      planetShape.segments.forEach((segment) {
        segment.segmentComponents.forEach((component) {
          // angle and position from last point to the end point.
          setComponentPosition(startOfLine, segment.positionEnd, planetShape.offset, component);
          components.add(component);
          if (component is EnemyBaseComponent || component is ReactorComponent) numberEnemies++;
        });
        startOfLine = segment.positionEnd; // track last position
      });
    });
    numEnemies = numberEnemies;
    return components;
  }

  void setComponentPosition(Vector2 start, Vector2 end, Vector2 offset, SegmentComponent component) {
    var deltaX = end.x - start.x;
    var deltaY = end.y - start.y;
    var angle = atan2(deltaY, deltaX);
    var segmentLength = sqrt(deltaY*deltaY + deltaX*deltaX);
    var componentLength = segmentLength * component.relativeAnchorLength;
    var componentPointX = start.x + componentLength * cos(angle);
    var componentPointY = start.y + componentLength * sin(angle);
    component.position = Vector2(componentPointX, componentPointY) + offset;
    component.angle = angle;
    // debugPrint('New component point $componentPointX, $componentPointY');
  }
}


