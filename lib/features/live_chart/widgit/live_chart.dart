import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/core/models/wifi_model.dart';
import 'package:sarthi/features/live/provider/wifi_data_provider.dart';
import 'package:sarthi/features/live_chart/data/live_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({super.key, required this.ivalue});
  final String ivalue;
  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chartData = getChartData();
    // Timer.periodic(Duration(milliseconds: 10), (timer) {

    //   updateDataSource();

    // });
  }

  num? value;

  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        Wifi_data? wifiData = ref.watch(socketProvider);
        if (wifiData != null) {
          // String dataValue =  widget.value;
          //to change later
          value = wifiData.aAcc1;
        }
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

  void updateDataSource(Map<String, dynamic> data) {
    int timeInSeconds = Timeline.now;
    double valuedata = data[value.toString()];
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);

    setState(() {
      chartData.removeAt(0);
      chartData.add(LiveData(time: timeInSeconds, value: valuedata));
    });
  }
}
