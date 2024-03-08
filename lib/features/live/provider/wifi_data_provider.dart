import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:sarthi/main.dart';
import 'dart:io';

import 'package:sarthi/models/wifi_model.dart';

final socketProvider = StateProvider<Wifi_data?>((ref) => null);
final socketDataProvider = FutureProvider((ref) async {
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

        // Parse the JSON string
        try {
          final jsonMap = json.decode(jsonString);

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
