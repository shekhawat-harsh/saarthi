import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyRectanglePainter {
  static Future<ui.Image> createImage(Rect rect, Color color) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Define the paint object
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw the rectangle onto the canvas
    canvas.drawRect(rect, paint);

    // Convert the canvas to an image
    final picture = recorder.endRecording();
    final image =
        await picture.toImage(rect.width.toInt(), rect.height.toInt());

    return image;
  }
}
