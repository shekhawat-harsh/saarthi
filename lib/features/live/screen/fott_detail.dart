import 'package:flutter/material.dart';
import 'package:sarthi/features/pressure_map/data/pressure_point.dart';
import 'package:sarthi/features/pressure_map/widgits/pressure_map.dart';

void main() {
  runApp(const MaterialApp(
    home: FootDetailPointsScreen(),
  ));
}

class FootDetailPointsScreen extends StatelessWidget {
  const FootDetailPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var pressurepoint = [
      const PressurePoint(0.1, 0.6, 0),
      const PressurePoint(0.2, 1.2, 1),
      const PressurePoint(0.2, 1.2, 1),
      const PressurePoint(0.2, 1.5, 1),
      // const PressurePoint(0.5, 1.5, 1),
      // const PressurePoint(0.6, 1.6, 1),
      // const PressurePoint(0.7, 1.7, 1),
      // const PressurePoint(0.8, 1.8, 1),
      // const PressurePoint(0.9, 1.9, 1),
      //   const PressurePoint(1, 2.0, 1),
      // const PressurePoint(1.41, 2.5, 0),
      // const PressurePoint(1.1135, 1.5, 0),
      // const PressurePoint(2.153, 0.5, 0),
      // const PressurePoint(1.1423, 0.5, 0),
      // const PressurePoint(2.231, 0.5, 0),
      // const PressurePoint(2.231, 0.5, 0),
    ];
    int pixelX = 100; // Number of points in x-axis
    int pixelY = 100; // Number of points in y-axis
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                  height: height * 0.6,
                  width: width * 0.6,
                  child: Heatmap(
                      heatValues: const [0.1, 0.9, 0.7, 1.0, 0.7, 7, 5, 0.4])),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          points(0.06, 0.1, context, Colors.blue),
          points(0.16, 0.29, context, Colors.red),
          points(0.2, 0.41, context, Colors.yellow),
          points(0.2, 0.15, context, Colors.yellow),
          points(0.22, 0.29, context, Colors.green),
          points(0.26, 0.4, context, Colors.pink),
          points(0.28, 0.17, context, Colors.blue),
          points(0.3, 0.31, context, Colors.blue),
          points(0.38, 0.12, context, Colors.blue),
          points(0.38, 0.231, context, Colors.red),
          points(0.38, 0.34, context, Colors.green),
          points(0.45, 0.09, context, Colors.blue),
          points(0.45, 0.2, context, Colors.green),
          points(0.45, 0.3, context, Colors.pink),
          points(0.51, 0.1, context, Colors.blue),
          points(0.51, 0.23, context, Colors.red),
          SizedBox(
            height: height * 0.6,
            width: width * 0.6,
            child: Image.asset(
              'assets/images/left_leg.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget points(double h, double w, BuildContext context, Color color) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
        top: height * h,
        left: width * w,
        child: Container(
          // backgroundColor: color,
          // radius: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.red.withOpacity(0.7),
                Colors.red,
                Colors.yellow,
                Colors.green
              ],
              stops: const [0.0, 0.12, 0.2, 0.4],
              center: Alignment.center,
              radius: 1.4,
            ),
          ),
          height: height * 0.06,
          width: width * 0.1,
          // color: color,
        ));
  }
}
