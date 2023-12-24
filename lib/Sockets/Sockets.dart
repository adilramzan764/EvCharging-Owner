import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../const/BaseURL.dart';

class SocketController extends GetxController {
  late IO.Socket socket;
  List<Map<String, dynamic>> order = [];

  void initSocket() {
    socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connect', (_) {
      print('Socket connected');
    });

    socket.on('65823fa9c93d7ef8ef6adfc8', (data) {
      order.add(data["spotExists"]);
      print("The list: " + order.length.toString());
      update(); // Notify listeners if needed
    });
  }
}
