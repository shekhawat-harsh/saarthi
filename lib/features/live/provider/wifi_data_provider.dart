import 'dart:convert';
import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:sarthi/core/models/wifi_model.dart';

List<Wifi_data?> wifi_dataList = [];
final socketProvider = StateProvider<Wifi_data?>((ref) => null);
final socketDataProvider = FutureProvider((ref) async {
  print('--------------------connecting--------------------');

  var socket =
      await Socket.connect('192.168.80.98', 8080); // Example socket connection

  print('----------------connected---------------');
  var buffer = '';

  socket.listen(
    (List<int> event) {
      print("----------------listening---------------");
      final data = utf8.decode(event); // Decode incoming bytes to string
      buffer += data; // Append the received data to the buffer

      // Continuously parse complete JSON objects from the buffer
      while (buffer.contains(' ')) {
        final newlineIndex = buffer.indexOf('\n');
        final jsonString = buffer.substring(0, newlineIndex);
        print(jsonString);

        // Parse the JSON string
        try {
          final jsonMap = json.decode(jsonString);
          // wifi_dataList.add(jsonMap);
          ref.watch(socketProvider.notifier).state =
              Wifi_data.fromJson(jsonMap);

          print('Received JSON: $jsonMap');
        } catch (e) {
          print('Error parsing JSON: $e');
        }

        // Remove the parsed JSON object from the buffer
        buffer = buffer.substring(newlineIndex + 1);
      }
    },
  );
});
