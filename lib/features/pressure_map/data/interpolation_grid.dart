List<double> linearInterpolateGrid(
  List<Offset> gridPoints,
  List<Offset> points,
  List<double> pressureValues,
) {
  List<double> interpolatedValues = [];

  // Iterate over each point in the grid
  for (var gridPoint in gridPoints) {
    // Find the nearest neighboring points in the known data
    Offset nearestPoint1 = points[0];
    Offset nearestPoint2 = points[1];
    double minDistance1 = (nearestPoint1 - gridPoint).distance;
    double minDistance2 = (nearestPoint2 - gridPoint).distance;

    for (int i = 2; i < points.length; i++) {
      double distance = (points[i] - gridPoint).distance;
      if (distance < minDistance1) {
        minDistance2 = minDistance1;
        minDistance1 = distance;
        nearestPoint2 = nearestPoint1;
        nearestPoint1 = points[i];
      } else if (distance < minDistance2) {
        minDistance2 = distance;
        nearestPoint2 = points[i];
      }
    }

    // Perform linear interpolation between the nearest neighboring points
    double t = minDistance1 / (minDistance1 + minDistance2);
    double interpolatedPressure = linearInterpolation(
      pressureValues[points.indexOf(nearestPoint1)],
      pressureValues[points.indexOf(nearestPoint2)],
      t,
    );
    interpolatedValues.add(interpolatedPressure);
  }

  return interpolatedValues;
}

double linearInterpolation(double startValue, double endValue, double t) {
  return startValue + (endValue - startValue) * t;
}

class Offset {
  final double dx;
  final double dy;

  const Offset(this.dx, this.dy);

  Offset operator -(Offset other) {
    return Offset(dx - other.dx, dy - other.dy);
  }

  double get distance => dx * dx + dy * dy;
}

void main() {
  // Example data points and pressure values
  List<Offset> gridPoints = [
    const Offset(0, 0),
    const Offset(0, 1),
    const Offset(0, 2),
    // Add more grid points here...
  ];
  List<Offset> points = [
    const Offset(0, 0),
    const Offset(0, 2),
    // Add more known points here...
  ];
  List<double> pressureValues = [
    0.2,
    1.0,
    // Add corresponding pressure values here...
  ];

  // Interpolate pressure values using linear interpolation
  List<double> interpolatedValues = linearInterpolateGrid(
    gridPoints,
    points,
    pressureValues,
  );

  print('Interpolated pressure values: $interpolatedValues');
}
