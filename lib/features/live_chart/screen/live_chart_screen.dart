import 'package:flutter/material.dart';
import 'package:sarthi/features/live_chart/widgit/live_chart.dart';

class LiveChartPage extends StatelessWidget {
  const LiveChartPage({super.key, required this.value1, required this.value2});
  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LiveChart(value: value1),
          const SizedBox(
            height: 24,
          ),
          LiveChart(value: value2)
        ],
      ),
    );
  }
}
