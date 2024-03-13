import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/features/pressure_map/data/pressure_point.dart';

class PressureMap extends ConsumerWidget {
  PressureMap({super.key, required this.pressurePoints});

  List<PressurePoint> pressurePoints;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Simulated pressure data (sampled from sensors on the foot)

    // Define grid points covering the rectangle
    List<Offset> gridPoints = [];
    for (double x = 0; x <= 1; x += 0.1) {
      for (double y = 0; y <= 1; y += 0.1) {
        gridPoints.add(Offset(x, y));
      }
    }

    // Interpolate pressure values for grid points
    List<double> interpolatedPressures =
        interpolatePressures(gridPoints, pressurePoints);

    return SizedBox(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: PressurePainter(interpolatedPressures),
      ),
    );
  }

  List<double> interpolatePressures(
      List<Offset> gridPoints, List<PressurePoint> pressurePoints) {
    List<double> interpolatedPressures = [];

    for (var gridPoint in gridPoints) {
      // Find nearest pressure points
      PressurePoint nearestPoint1 = pressurePoints[0];
      PressurePoint nearestPoint2 = pressurePoints[1];
      double minDistance1 = distance(gridPoint, nearestPoint1);
      double minDistance2 = distance(gridPoint, nearestPoint2);

      for (int i = 2; i < pressurePoints.length; i++) {
        double dist = distance(gridPoint, pressurePoints[i]);
        if (dist < minDistance1) {
          minDistance2 = minDistance1;
          minDistance1 = dist;
          nearestPoint2 = nearestPoint1;
          nearestPoint1 = pressurePoints[i];
        } else if (dist < minDistance2) {
          minDistance2 = dist;
          nearestPoint2 = pressurePoints[i];
        }
      }

      // Perform linear interpolation between pressure points
      double t = minDistance1 / (minDistance1 + minDistance2);
      double interpolatedPressure = linearInterpolation(
        nearestPoint1.pressure,
        nearestPoint2.pressure,
        t,
      );
      interpolatedPressures.add(interpolatedPressure);
    }

    return interpolatedPressures;
  }

  double linearInterpolation(double startValue, double endValue, double t) {
    return startValue + (endValue - startValue) * t;
  }

  double distance(Offset p1, PressurePoint p2) {
    return sqrt(
        (p1.dx - p2.x) * (p1.dx - p2.x) + (p1.dy - p2.y) * (p1.dy - p2.y));
  }
}

class PressurePainter extends CustomPainter {
  final List<double> pressureValues;

  PressurePainter(this.pressureValues);

  @override
  void paint(Canvas canvas, Size size) {
    final double cellWidth = size.width / 10;
    final double cellHeight = size.height / 10;
    final Paint paint = Paint();

    int index = 0;
    for (int row = 0; row < 10; row++) {
      for (int col = 0; col < 10; col++) {
        double pressure = pressureValues[index++];
        paint.color = getCellColor(pressure);
        canvas.drawRect(
          Rect.fromLTWH(
              col * cellWidth, row * cellHeight, cellWidth, cellHeight),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Color getCellColor(double pressure) {
    // Map pressure values to colors
    if (pressure >= 0.6) {
      return Colors.red; // High pressure
    } else if (pressure <= 0.2) {
      return Colors.green; // Low pressure
    } else {
      // Interpolate color for pressure values between 0.2 and 0.6
      double t = (pressure - 0.2) / (0.6 - 0.2);
      int red = (255 * t).round();
      int green = (255 * (1 - t)).round();
      return Color.fromARGB(255, red, green, 0);
    }
  }
}
