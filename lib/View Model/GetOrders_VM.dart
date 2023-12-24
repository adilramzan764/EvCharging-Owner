// view_models/order_view_model.dart

import 'package:car_charging/const/BaseURL.dart';
import 'package:get/get.dart';

import '../ApiServices/GetOders_Api.dart';
import '../Model/OrderModel.dart';

class OrderViewModel extends GetxController {
  RxList<OrderModel> orders = <OrderModel>[].obs; // Use OrderModel instead of dynamic

  final GetOrders_Api orderApi = GetOrders_Api();

  Future<void> fetchOrdersById() async {
    try {
      final List<OrderModel> ordersResult = await orderApi.getOrdersById();

      orders.value = ordersResult;
    } catch (error) {
      print("Error: $error");
    }
  }
}







