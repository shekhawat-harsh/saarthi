import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/features/live_chart/data/live_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({super.key, required this.value});
  final String value;
  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chartData = getChartData();
  }

  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        
        return Container(
          child: SfCartesianChart(
            series: [
              LineSeries<LiveData, int>(
                dataSource: chartData,
                onRendererCreated: (controller) {
                  _chartSeriesController = controller;
                },
                xValueMapper: (LiveData datum, int index) {
                  return datum.time;
                },
                yValueMapper: (LiveData datum, int index) {
                  return datum.value;
                },
              )
            ],
          ),
        );
      },
    );
  }

  List<LiveData> getChartData() {
    return [
      LiveData(time: 0, value: 0),
      LiveData(time: 1, value: 0),
      LiveData(time: 2, value: 0),
      LiveData(time: 3, value: 0),
      LiveData(time: 4, value: 0),
      LiveData(time: 5, value: 0),
      LiveData(time: 7, value: 0),
      LiveData(time: 8, value: 0),
      LiveData(time: 9, value: 0),
      LiveData(time: 10, value: 0),
    ];
  }

  void updateDataSource(String jsonData) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    int timeInSeconds = Timeline.now;
    double value = data[widget.value];
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);

    setState(() {
      chartData.removeAt(0);
      chartData.add(LiveData(time: timeInSeconds, value: value));
    });
  }
}
