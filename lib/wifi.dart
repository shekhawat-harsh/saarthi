// import 'dart:convert';
// import 'dart:io';

// void main() async {
//   print("----------connecting------------");
//   final socket =
//       await Socket.connect('192.168.80.98', 8080); // Example socket connection
//   var buffer = '';
//   print("----------connected------------ ");
//   socket.listen(
//     (List<int> event) {
//       final data = utf8.decode(event); // Decode incoming bytes to string
//       buffer += data; // Append the received data to the buffer

//       // Continuously parse complete JSON objects from the buffer
//       while (buffer.contains(' ')) {
//         final newlineIndex = buffer.indexOf('\n');
//         final jsonString = buffer.substring(0, newlineIndex);

//         // Parse the JSON string
//         try {
//           final jsonMap = json.decode(jsonString);

//           print('Received JSON: $jsonMap');
//         } catch (e) {
//           print('Error parsing JSON: $e');
//         }

//         // Remove the parsed JSON object from the buffer
//         buffer = buffer.substring(newlineIndex + 1);
//       }
//     },
//     onError: (error) {
//       print('Socket error: $error');
//     },
//     onDone: () {
//       print('Socket closed');
//       socket.destroy();
//     },
//   );
// }
