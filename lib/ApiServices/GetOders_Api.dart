// api/order_api.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/OrderModel.dart';
import '../const/BaseURL.dart';

class GetOrders_Api {
  Future<List<Map<String, dynamic>>> getOrdersById() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString("id");
    final response = await http.get(Uri.parse('${baseUrl}getOrdersById/6588c6c29af2fafb9d26d5ad'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = json.decode(response.body)['orders'];
      final List<Map<String, dynamic>> listJson = decodedJson.cast<Map<String, dynamic>>();

      return listJson;
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
