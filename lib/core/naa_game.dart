import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/game/game.dart';
import 'package:not_an_artist/core/components/grid.dart';

class NAA extends Game {
  Size size;
  List<Component> components = [];

  static NAA _instance;

  static initialize(Size size) {
    _instance = NAA._(size);
    _instance.add(Grid(size));
  }

  void add(Component component) {
    components.add(component);
  }

  ///Singleton instance of the game
  static NAA get instance => _instance;

  NAA._(this.size);

  @override
  void render(Canvas canvas) {
    components.forEach((component) {
      component.render(canvas);
    });
  }

  @override
  void update(double c) {}
}
