// api/order_api.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/OrderModel.dart';
import '../const/BaseURL.dart';

class GetOrders_Api {
  Future<List<OrderModel>> getOrdersById() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString("id");
    final response = await http.get(Uri.parse('${baseUrl}getOrdersById/65823fa9c93d7ef8ef6adfc8'));
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> listJson = json.decode(response.body)['orders']; // Explicit casting to List<dynamic>
      print(response);

      return listJson.map((json) => OrderModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
