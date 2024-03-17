import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/core/models/wifi_model.dart';
import 'package:sarthi/features/live/provider/wifi_data_provider.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  void socketConnectionData() async {
    final socket = await Socket.connect(
        '192.168.179.98', 8080); // Example socket connection
    var buffer = '';
    print('connection..');
    socket.listen(
      (List<int> event) {
        final data = utf8.decode(event); // Decode incoming bytes to string
        buffer += data; // Append the received data to the buffer

        // Continuously parse complete JSON objects from the buffer
        while (buffer.contains(' ')) {
          final newlineIndex = buffer.indexOf('\n');
          final jsonString = buffer.substring(0, newlineIndex);

          // Parse the JSON string
          try {
            final jsonMap = json.decode(jsonString);
            //  setState(() {
            //     wifi_data = Wifi_data.fromJson(jsonMap);
            //  });
            // context.read(socketProvider).state = Wifi_data.fromJson(jsonMap);
            print('Received JSON: $jsonMap');
          } catch (e) {
            print('Error parsing JSON: $e');
          }

          // Remove the parsed JSON object from the buffer
          buffer = buffer.substring(newlineIndex + 1);
        }
      },
      onError: (error) {
        print('Socket error: $error');
      },
      onDone: () {
        print('Socket closed');
        socket.destroy();
      },
    );
  }

  @override
  void initState() {
    // socketConnectionData();
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
            Wifi_data? wifiData = ref.watch(socketProvider);
            print("--------socket data------------------");
            print(wifiData!.aAcc1 ?? "..");
            return Column(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
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
                      child: const SizedBox(
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
                                "13.5m",
                                style: TextStyle(
                                    color: Color.fromARGB(128, 255, 255, 255)),
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
                        child: const SizedBox(
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
                                  "13.5m",
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
                          child: const Column(
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
                                "13.5m",
                                style: TextStyle(
                                    color: Color.fromARGB(128, 255, 255, 255)),
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
                          child: const Column(
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
                                "13.5m",
                                style: TextStyle(
                                    color: Color.fromARGB(128, 255, 255, 255)),
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
                          child: const Column(
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
                                "13.5m",
                                style: TextStyle(
                                    color: Color.fromARGB(128, 255, 255, 255)),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
