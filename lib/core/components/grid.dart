import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

class Grid extends Component {
  Size size;
  Paint paint;
  Paint vertsPaint;
  Paint diagsPaint;
  int zoom = 3;

  Grid(this.size, [this.paint, this.vertsPaint, this.diagsPaint]) {
    if (paint == null) {
      paint = Paint()..color = Colors.white60;
    }
    if (vertsPaint == null) {
      vertsPaint = Paint()..color = Colors.black54;
    }
    if (diagsPaint == null) {
      diagsPaint = Paint()..color = Colors.black54;
    }
  }

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    drawVerticals(c);
    drawDiagonals(c);
  }

  drawVerticals(Canvas c) {
    List.generate(numVerts, (index) {
      c.drawLine(Offset(cellWidth * index / 2, 0),
          Offset(cellWidth * index / 2, size.height), vertsPaint);
    });
  }

  drawDiagonals(Canvas c) {
    List.generate(numDiags, (index) {
      var p1 = Offset(0, cellHeight * index / 4);
      var p2 = Offset(cellWidth * index, 0);
      c.drawLine(p1, p2, diagsPaint);

      var p3 = Offset(size.width, cellHeight * index / 4);
      var p4 = Offset(size.width - (index * cellWidth), 0);

      c.drawLine(p3, p4, diagsPaint);
    });
  }

  int get numDiags => (size.height / cellHeight * 5).ceil();
  int get numVerts => (size.width / cellWidth * 4).floor();
  double get cellWidth => size.width / zoom;
  double get cellHeight => size.height / zoom;

  @override
  void update(double c) {}
}
