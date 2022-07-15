import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import '../extensions/generic.dart';

///
/// explosives detonating after an object is destroyed
///

ParticleSystemComponent reactorExplosion(Vector2 position) => ParticleSystemComponent(
  particle: TranslatedParticle(
    lifespan: 6,
    offset: position,
    child: hugeExplosion,
  ),
  priority: 4,
);

ParticleSystemComponent planetExplosion(Vector2 position) => ParticleSystemComponent(
      particle: TranslatedParticle(
        lifespan: 3,
        offset: position,
        child: largeExplosion,
      ),
      priority: 4,
    );

ParticleSystemComponent shipExplosion(Vector2 position) => ParticleSystemComponent(
      particle: TranslatedParticle(
        lifespan: 1.5,
        offset: position,
        child: mediumExplosion,
      ),
      priority: 4,
    );

ParticleSystemComponent bulletExplosion(Vector2 position) => ParticleSystemComponent(
      particle: TranslatedParticle(
        lifespan: 1,
        offset: position,
        child: smallExplosion,
      ),
      priority: 4,
    );

Particle get smallExplosion => baseExplosion(6, 10, 1);

Particle get mediumExplosion => baseExplosion(10, 20, 3);

Particle get largeExplosion => baseExplosion(20, 50, 5);

Particle get hugeExplosion => baseExplosion(300, 200, 10);

Particle baseExplosion(int count, double boxSize, int particleMaxSize) {
  Vector2 cellSize = Vector2(boxSize, boxSize);

  /// Returns random [Vector2] within a virtual grid cell
  Vector2 randomCellVector2() {
    return (Vector2.random() - Vector2.random())..multiply(cellSize);
  }

  final paints = [
    Colors.amber,
    Colors.amberAccent,
    Colors.red,
    Colors.redAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.blue,
  ].map((color) => Paint()..color = color).toList();

  return Particle.generate(
    count: count,
    generator: (i) {
      final initialSpeed = randomCellVector2();
      final accelVector = Vector2(-0.1, -0.1);

      return AcceleratedParticle(
        speed: initialSpeed,
        acceleration: accelVector,
        child: ComputedParticle(
          renderer: (canvas, particle) {
            final paint = paints.randomElement();
            paint.color = paint.color.withOpacity(1 - particle.progress);
            canvas.drawCircle(
              Offset.zero,
              0.1 + (particleMaxSize * particle.progress),
              paint,
            );
          },
        ),
      );
    },
  );
}
