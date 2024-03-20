import 'package:flutter/material.dart';

class FootDetailScreen extends StatelessWidget {
  const FootDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          Container(
            color: Colors.grey,
            height: height * 0.6,
            width: width * 0.6,
            child: Image.asset(
              'assets/images/foot_right.png',
              fit: BoxFit.fill,
            ),
          ),
          points(0.14, 0.17, context, Colors.blue),
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
