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
            var res = ref.watch(socketDataProvider);
            Wifi_data? wifiData = ref.watch(socketProvider);
            print("--------socket data------------------");
            // print(wifiData!.aAcc1 ?? "..");
            if (wifiData != null) {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      PressureMap(pressurePoints: [
                        PressurePoint(
                            1, 1, double.tryParse(wifiData.aAcc1.toString())!),
                        PressurePoint(0.99, 0.33,
                            double.tryParse(wifiData.aAcc2.toString())!),
                        PressurePoint(0.12, 0.23,
                            double.tryParse(wifiData.bAcc1.toString())!),
                        PressurePoint(0.15, 0.56,
                            double.tryParse(wifiData.bAngle2.toString())!),
                        PressurePoint(0.11, 0.78,
                            double.tryParse(wifiData.aAcc3.toString())!),
                        PressurePoint(0.89, 0.34,
                            double.tryParse(wifiData.bAcc1.toString())!),
                        PressurePoint(0.90, 0.34,
                            double.tryParse(wifiData.bAcc2.toString())!),
                        PressurePoint(0.67, 0.89,
                            double.tryParse(wifiData.bAcc3.toString())!),
                        PressurePoint(0.89, 0.76,
                            double.tryParse(wifiData.fSR9.toString())!),
                        PressurePoint(0.34, 0.67,
                            double.tryParse(wifiData.fSR5.toString())!),
                        PressurePoint(0.23, 0.89,
                            double.tryParse(wifiData.fSR7.toString())!)
                      ]),
                    ],
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
                        child: SizedBox(
                            height: 74,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Step Length",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifiData.fSR14.toString(),
                                  style: const TextStyle(
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
                              height: 74,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Stride Length",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    wifiData.aAcc2.toString(),
                                    style: const TextStyle(
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
                                const Text(
                                  "Dorsiflexion",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifiData.aAcc3.toString(),
                                  style: const TextStyle(
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
                                const Text(
                                  "Stride Length",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifiData.bAcc1.toString(),
                                  style: const TextStyle(
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
                                const Text(
                                  "Stride Length",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  wifiData.bAcc2.toString(),
                                  style: const TextStyle(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}


// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sarthi/core/models/wifi_model.dart';
// import 'package:sarthi/features/live/provider/wifi_data_provider.dart';
// import 'package:sarthi/features/pressure_map/data/pressure_point.dart';
// import 'package:sarthi/features/pressure_map/widgits/pressure_map.dart';

// class LivePage extends ConsumerWidget {
//   const LivePage({super.key});

//   void socketConnectionData() async {
//     print('--------------------connecting--------------------');

//     var socket =
//         await Socket.connect('172.20.10.4', 8080); // Example socket connection

//     print('----------------connected---------------');
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var scWidth = MediaQuery.of(context).size.width;
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Consumer(
//           builder: (BuildContext context, WidgetRef ref, Widget? child) {
//             var res = ref.watch(socketDataProvider);
//             Wifi_data? wifiData = ref.watch(socketProvider);
//             print("--------socket data------------------");
//             if (wifiData != null) {
//               return Column(
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 80,
//                   ),
//                   Expanded(
//                       child: Row(
//                     children: [
//                       PressureMap(pressurePoints: [
//                         PressurePoint(
//                             1, 1, double.tryParse(wifiData.fSR11.toString())!),
//                         PressurePoint(0.99, 0.33,
//                             double.tryParse(wifiData.aAcc2.toString())!),
//                         PressurePoint(0.12, 0.23,
//                             double.tryParse(wifiData.bAcc1.toString())!),
//                         PressurePoint(0.15, 0.56,
//                             double.tryParse(wifiData.bAngle2.toString())!),
//                         PressurePoint(0.11, 0.78,
//                             double.tryParse(wifiData.fSR14.toString())!),
//                         PressurePoint(0.89, 0.34,
//                             double.tryParse(wifiData.fSR6.toString())!),
//                         PressurePoint(0.90, 0.34,
//                             double.tryParse(wifiData.fSR3.toString())!),
//                         PressurePoint(0.67, 0.89,
//                             double.tryParse(wifiData.fSR8.toString())!),
//                         PressurePoint(0.89, 0.76,
//                             double.tryParse(wifiData.fSR9.toString())!),
//                         PressurePoint(0.34, 0.67,
//                             double.tryParse(wifiData.fSR5.toString())!),
//                         PressurePoint(0.23, 0.89,
//                             double.tryParse(wifiData.fSR7.toString())!)
//                       ]),
//                     ],
//                   )),
//                   const SizedBox(
//                     height: 160,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Colors.black),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.horizontal(
//                                         left: Radius.circular(20))))),
//                         onPressed: () {},
//                         child: SizedBox(
//                             height: 74,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Step Length",
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 Text(
//                                   wifiData.fSR14.toString(),
//                                   style: const TextStyle(
//                                       color:
//                                           Color.fromARGB(128, 255, 255, 255)),
//                                 )
//                               ],
//                             )),
//                       ),
//                       const SizedBox(width: 2),
//                       ElevatedButton(
//                           style: const ButtonStyle(
//                               backgroundColor:
//                                   MaterialStatePropertyAll(Colors.black),
//                               shape: MaterialStatePropertyAll(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.horizontal(
//                                           right: Radius.circular(20))))),
//                           onPressed: () {},
//                           child: SizedBox(
//                               height: 74,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     "Stride Length",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                   Text(
//                                     wifiData.aAcc2.toString(),
//                                     style: const TextStyle(
//                                         color:
//                                             Color.fromARGB(128, 255, 255, 255)),
//                                   )
//                                 ],
//                               ))),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Colors.black),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.horizontal(
//                                         left: Radius.circular(20))))),
//                         onPressed: () {},
//                         child: SizedBox(
//                             width: scWidth / 6,
//                             height: 70,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Dorsiflexion",
//                                   style: TextStyle(
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 Text(
//                                   wifiData.aAcc3.toString(),
//                                   style: const TextStyle(
//                                       color:
//                                           Color.fromARGB(128, 255, 255, 255)),
//                                 )
//                               ],
//                             )),
//                       ),
//                       const SizedBox(width: 2),
//                       ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Colors.black),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(0))))),
//                         onPressed: () {},
//                         child: SizedBox(
//                             width: scWidth / 6,
//                             height: 70,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Stride Length",
//                                   style: TextStyle(
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 Text(
//                                   wifiData.bAcc1.toString(),
//                                   style: const TextStyle(
//                                       color:
//                                           Color.fromARGB(128, 255, 255, 255)),
//                                 )
//                               ],
//                             )),
//                       ),
//                       const SizedBox(width: 2),
//                       ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Colors.black),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.horizontal(
//                                         right: Radius.circular(20))))),
//                         onPressed: () {},
//                         child: SizedBox(
//                             height: 70,
//                             width: scWidth / 6,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Stride Length",
//                                   style: TextStyle(
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 Text(
//                                   wifiData.bAcc2.toString(),
//                                   style: const TextStyle(
//                                       color:
//                                           Color.fromARGB(128, 255, 255, 255)),
//                                 )
//                               ],
//                             )),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
