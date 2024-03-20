// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:sarthi/features/pressure_map/data/pressure_point.dart';

// void main(List<String> args) {
//   var pressurepoint = [
//     const PressurePoint(0.1, 0.6, 0),
//     const PressurePoint(0.1, 1.2, 1),
//     const PressurePoint(0.1, 1.3, 1),
//     const PressurePoint(0.1, 1.4, 1),
//     const PressurePoint(0.1, .5, 1),
//     const PressurePoint(2.1, 1.5, 0),
//     const PressurePoint(2.6, 1.5, 0),
//     const PressurePoint(2.1, 2.5, 0),
//     const PressurePoint(1.1, 1.5, 0),
//     const PressurePoint(0.11, 2.5, 0),
//     const PressurePoint(1.41, 2.5, 0),
//     const PressurePoint(1.1135, 1.5, 0),
//     const PressurePoint(2.153, 0.5, 0),
//     const PressurePoint(1000000, 10000000, 0),
//     const PressurePoint(2.231, 0.5, 0),
//   ];

//   int pixelX = 100; // Number of points in x-axis
//   int pixelY = 100; // Number of points in y-axis

//   runApp(MaterialApp(
//     home: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Center(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   PressureMap(
//                     imageName: "assets/images/left_leg.png",
//                     pressurePoints: pressurepoint,
//                     pixelX: pixelX,
//                     pixelY: pixelY,
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   PressureMap(
//                     imageName: "assets/images/right_leg.png",
//                     pressurePoints: pressurepoint,
//                     pixelX: pixelX,
//                     pixelY: pixelY,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 2,
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   ));
// }

// class PressureMap extends StatefulWidget {
//   const PressureMap(
//       {super.key,
//       required this.imageName,
//       required this.pressurePoints,
//       required this.pixelX,
//       required this.pixelY});
//   final String imageName;
//   final List<PressurePoint> pressurePoints;
//   final int pixelX;
//   final int pixelY;

//   @override
//   State<PressureMap> createState() => _PressureMapState();
// }

// class _PressureMapState extends State<PressureMap> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     // Define grid points covering the rectangle
//     List<Offset> gridPoints = [];
//     for (double x = 0; x <= 1; x += 1 / (widget.pixelX - 1)) {
//       for (double y = 0; y <= 1; y += 1 / (widget.pixelY - 1)) {
//         gridPoints.add(Offset(x, y));
//       }
//     }

//     // Interpolate pressure values for grid points
//     List<double> interpolatedPressures = interpolatePressures(
//         gridPoints, widget.pressurePoints, widget.pixelX, widget.pixelY);

//     return Stack(
//       children: [
//         SizedBox(
//           width: width * 0.6, //
//           height: height * 0.6,
//           child: CustomPaint(
//             painter: PressurePainter(
//                 widget.pressurePoints, widget.pixelX, widget.pixelY),
//           ),
//         ),
//       ],
//     );
//   }

//   List<double> interpolatePressures(List<Offset> gridPoints,
//       List<PressurePoint> pressurePoints, int pixelX, int pixelY) {
//     List<double> interpolatedPressures = [];

//     for (var gridPoint in gridPoints) {
//       // Find nearest pressure points
//       PressurePoint nearestPoint1 = pressurePoints[0];
//       PressurePoint nearestPoint2 = pressurePoints[1];
//       double minDistance1 = distance(gridPoint, nearestPoint1);
//       double minDistance2 = distance(gridPoint, nearestPoint2);

//       for (int i = 2; i < pressurePoints.length; i++) {
//         double dist = distance(gridPoint, pressurePoints[i]);
//         if (dist < minDistance1) {
//           minDistance2 = minDistance1;
//           minDistance1 = dist;
//           nearestPoint2 = nearestPoint1;
//           nearestPoint1 = pressurePoints[i];
//         } else if (dist < minDistance2) {
//           minDistance2 = dist;
//           nearestPoint2 = pressurePoints[i];
//         }
//       }

//       // Perform linear interpolation between pressure points
//       double t = minDistance1 / (minDistance1 + minDistance2);
//       double interpolatedPressure = linearInterpolation(
//         nearestPoint1.pressure,
//         nearestPoint2.pressure,
//         t,
//       );
//       interpolatedPressures.add(interpolatedPressure);
//     }

//     return interpolatedPressures;
//   }

//   double linearInterpolation(double startValue, double endValue, double t) {
//     return startValue + (endValue - startValue) * t;
//   }

//   double distance(Offset p1, PressurePoint p2) {
//     return sqrt(
//         (p1.dx - p2.x) * (p1.dx - p2.x) + (p1.dy - p2.y) * (p1.dy - p2.y));
//   }
// }

// // class PressurePainter extends CustomPainter {
// //   final List<double> pressureValues;
// //   final int pixelX;
// //   final int pixelY;

// //   PressurePainter(this.pressureValues, this.pixelX, this.pixelY);

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final double cellWidth = size.width / pixelX;
// //     final double cellHeight = size.height / pixelY;
// //     final Paint paint = Paint();

// //     int index = 0;
// //     for (int row = 0; row < pixelY; row++) {
// //       for (int col = 0; col < pixelX; col++) {
// //         double pressure = pressureValues[index++];
// //         paint.color = getCellColor(pressure);
// //         canvas.drawRect(
// //           Rect.fromLTWH(
// //               col * cellWidth, row * cellHeight, cellWidth, cellHeight),
// //           paint,
// //         );
// //       }
// //     }
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return false;
// //   }

// //   Color getCellColor(double pressure) {
// //     // Map pressure values to colors
// //     // if (pressure >= 0.6) {
// //     //   return Colors.red; // High pressure
// //     // } else if (pressure <= 0.2) {
// //     //   return Colors.green; // Low pressure
// //     // } else {
// //     //   // Interpolate color for pressure values between 0.2 and 0.6
// //     //   double t = (pressure - 0.2) / (0.6 - 0.2);
// //     //   int red = (255 * t).round();
// //     //   int green = (255 * (1 - t)).round();
// //     //   return Color.fromARGB(255, red, green, 0);
// //     // }

// //     if (pressure == 1) {
// //       return Colors.red;
// //     } else {
// //       return Colors.black;
// //     }
// //   }
// // }

// class PressurePainter extends CustomPainter {
//   final List<PressurePoint> pressurePoints;
//   final int pixelX;
//   final int pixelY;

//   PressurePainter(this.pressurePoints, this.pixelX, this.pixelY);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double cellWidth = size.width / pixelX;
//     final double cellHeight = size.height / pixelY;
//     final Paint whitePaint = Paint()..color = Colors.white;
//     final Paint blackPaint = Paint()..color = Colors.black;

//     for (int row = 0; row < pixelY; row++) {
//       for (int col = 0; col < pixelX; col++) {
//         Offset currentPoint =
//             Offset(col.toDouble() / pixelX, row.toDouble() / pixelY);
//         bool isPressurePoint = pressurePoints.any((point) =>
//             point.x == currentPoint.dx && point.y == currentPoint.dy);
//         Paint paint = isPressurePoint ? whitePaint : blackPaint;

//         canvas.drawRect(
//           Rect.fromLTWH(
//               col * cellWidth, row * cellHeight, cellWidth, cellHeight),
//           paint,
//         );
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

import 'dart:math' as math;

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Center(
      child: Heatmap(heatValues: const [0.2, 0.1, 1, 0.8, 0.3, 0.9, 0.4, 0.3]),
    ),
  ));
}

class Heatmap extends StatelessWidget {
  final List<double> heatValues;
  final Map<Point, double> valueMap; // Map coordinates to heat values

  Heatmap({super.key, required this.heatValues})
      : valueMap = {
          const Point(1, 1): heatValues[0],
          // const Point(1, 3): heatValues[1],
          // const Point(3, 1): heatValues[2],
          // const Point(2, 1): heatValues[3],
          // const Point(1, 10): heatValues[4],
          // const Point(1, 4): heatValues[5],
          // const Point(2, 2): heatValues[6],
        };

  @override
  Widget build(BuildContext context) {
    const rows = 20;
    const columns = 10;
    final cellWidth = MediaQuery.of(context).size.width / columns;
    final cellHeight = MediaQuery.of(context).size.height / rows;

    // Initialize valueMap with provided heat values at coordinates
    for (var i = 0; i < heatValues.length; i += 2) {
      final x = heatValues[i];
      final y = heatValues[i + 1];
      valueMap[Point(x.toInt(), y.toInt())] = heatValues[i];
    }

    // Interpolate missing values
    for (var x = 0; x < columns; x++) {
      for (var y = 0; y < rows; y++) {
        if (!valueMap.containsKey(Point(x, y))) {
          final neighbors = _getNeighbors(Point(x, y), valueMap.keys);
          valueMap[Point(x, y)] = _interpolateValue(neighbors);
        }
      }
    }

    return GridView.count(
      crossAxisCount: columns,
      children: List.generate(rows * columns, (index) {
        final point = Point(index % columns, index ~/ columns);
        final value = valueMap[point]!;
        final color = getColor(value);
        return Container(
          width: cellWidth,
          height: cellHeight,
          color: color,
        );
      }),
    );
  }

  Color? getColor(double value) {
    const minColor = Color(0xFF00FF00); // Green
    const maxColor = Color(0xFFFF0000); // Red
    final ratio = math.max(0.0, math.min(1.0, (value - 0.2) / (1.0 - 0.2)));
    return Color.lerp(minColor, maxColor, ratio);
  }

  List<Point> _getNeighbors(Point point, Iterable<Point> existingPoints) {
    final neighbors = <Point>[];
    for (var dx = -1; dx <= 1; dx++) {
      for (var dy = -1; dy <= 1; dy++) {
        final newPoint = Point(point.x + dx, point.y + dy);
        if (existingPoints.contains(newPoint) && newPoint != point) {
          neighbors.add(newPoint);
        }
      }
    }
    return neighbors;
  }

  double _interpolateValue(List<Point> neighbors) {
    var sum = 0.0;
    for (final neighbor in neighbors) {
      sum += valueMap[neighbor]!;
    }
    return sum / neighbors.length;
  }
}

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Point && x == other.x && y == other.y;

  @override
  int get hashCode => hashValues(x, y);
}
