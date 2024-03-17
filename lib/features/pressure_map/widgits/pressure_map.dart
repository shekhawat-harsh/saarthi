import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_heat_map/flutter_heat_map.dart';
import 'package:sarthi/features/pressure_map/widgits/rectangle_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Heat Map'),
        ),
        body: Center(
          child: FutureBuilder<Uint8List?>(
            future: generateHeatMap(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return HeatMapImage(snapshot.data);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> generateHeatMap() async {
    final List<HeatMapEvent> points = [
      HeatMapEvent(location: const Offset(1, 1)),
      HeatMapEvent(location: const Offset(0, 0)),
      HeatMapEvent(location: const Offset(0.5, 0.5)),
      // Add more points as needed
    ];

    var rectangle =
        await MyRectanglePainter.createImage(Rect.largest, Colors.black);

    final HeatMapPage data =
        HeatMapPage(image: rectangle, events: points, pixelRatio: 5);

    return await HeatMap.process(data);
  }
}

class HeatMapImage extends StatelessWidget {
  final Uint8List? bytes;

  const HeatMapImage(this.bytes, {super.key});

  @override
  Widget build(BuildContext context) {
    if (bytes != null) {
      return Image.memory(bytes!);
    } else {
      return const CircularProgressIndicator(); // Placeholder while processing
    }
  }
}
