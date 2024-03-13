import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/features/live/provider/wifi_data_provider.dart';
import 'package:sarthi/models/wifi_model.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  void socketConnectionData() async {
       print('--------------------connecting--------------------');
 
  var socket =
      await Socket.connect('172.20.10.4', 8080); // Example socket connection
  
    print('----------------connected---------------');
  
  }

  @override
  void initState() {
    socketConnectionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            var res = ref.watch(socketDataProvider);
            Wifi_data? wifi_data = ref.watch(socketProvider);
            print("--------socket data------------------");
            if (wifi_data != null) {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  const Image(image: AssetImage("assets/images/feet.png")),
                  const SizedBox(
                    height: 160,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(20))))),
                        onPressed: () {},
                        child: SizedBox(
                            height: 74,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Step Length",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifi_data.fSR14.toString(),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(128, 255, 255, 255)),
                                )
                              ],
                            )),
                      ),
                      SizedBox(width: 2),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(20))))),
                          onPressed: () {},
                          child: SizedBox(
                              height: 74,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Stride Length",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    wifi_data.aAcc2.toString(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(128, 255, 255, 255)),
                                  )
                                ],
                              ))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(20))))),
                        onPressed: () {},
                        child: SizedBox(
                            width: scWidth / 6,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dorsiflexion",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifi_data.aAcc3.toString(),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(128, 255, 255, 255)),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(width: 2),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))))),
                        onPressed: () {},
                        child: SizedBox(
                            width: scWidth / 6,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Stride Length",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifi_data.bAcc1.toString(),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(128, 255, 255, 255)),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(width: 2),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(20))))),
                        onPressed: () {},
                        child: SizedBox(
                            height: 70,
                            width: scWidth / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Stride Length",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifi_data.bAcc2.toString(),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(128, 255, 255, 255)),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
