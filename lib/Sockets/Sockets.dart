import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../Model/OrderModel.dart';
import '../View Model/GetOrders_VM.dart';
import '../const/BaseURL.dart';

class SocketController extends GetxController {
  late IO.Socket socket;
  var orderList = <Map<String, dynamic>>[].obs;
  final OrderViewModel orderViewModel = Get.find();

  void init() {
    // Fetch old orders from the API
    print("Object");
    orderViewModel.fetchOrdersById().then((_) {
      orderList.assignAll(orderViewModel.orders);
    });
    print(orderList);

  }


  void initSocket() {
    print("trying to connect");
    socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connect', (_) {
      print('Socket connected');
    });

    socket.on('6588c6c29af2fafb9d26d5ad', (data) {
      orderList.add(data["newBooking"]); // Assuming spotExists is of type OrderModel
      update(); // Notify listeners if needed
    });

  }
}
