import 'dart:ui';

Offset linearInterpolation(Offset start, Offset end, double t) {
  // Extract x and y coordinates from start and end points
  double startX = start.dx;
  double startY = start.dy;
  double endX = end.dx;
  double endY = end.dy;

  // Perform linear interpolation for x and y coordinates
  double interpolatedX = startX + (endX - startX) * t;
  double interpolatedY = startY + (endY - startY) * t;

  // Return the interpolated Offset point
  return Offset(interpolatedX, interpolatedY);
}

void main() {
  // Example data points
  Offset startPoint = const Offset(0, 0);
  Offset endPoint = const Offset(100, 200);
  double t = 0.5; // Interpolation factor

  // Perform linear interpolation
  Offset interpolatedPoint = linearInterpolation(startPoint, endPoint, t);

  print('Interpolated point at t = $t: $interpolatedPoint');
}
