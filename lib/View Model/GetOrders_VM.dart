// view_models/order_view_model.dart

import 'package:car_charging/const/BaseURL.dart';
import 'package:get/get.dart';

import '../ApiServices/GetOders_Api.dart';
import '../Model/OrderModel.dart';

class OrderViewModel extends GetxController {
  RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;

  final GetOrders_Api orderApi = GetOrders_Api();

  Future<void> fetchOrdersById() async {
    try {
      final List<Map<String, dynamic>> ordersResult = await orderApi.getOrdersById();
      orders.addAll(ordersResult); // Wrap ordersResult in a list
      // print("this is the list:" + orders.toString());
    } catch (error) {
      print("object");
      print("Error: $error");
    }
  }
}








