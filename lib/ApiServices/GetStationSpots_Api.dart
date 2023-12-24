import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/ChargingSpotModel.dart';
import '../const/BaseURL.dart';

class GetStationSpots_Api {

  Future<List<ChargingSpotModel>> getSellerStationSpots() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userId = preferences.getString("id");
      final response = await http.get(Uri.parse('${baseUrl}getSellerStationSpots/65822ff4772a4f47226d0d53'));

      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> spotsJson = json.decode(response.body)['spots'];
        print(spotsJson);
        return spotsJson.map((spotJson) => ChargingSpotModel.fromJson(spotJson)).toList();
      } else {
        throw Exception('Failed to load spots');
      }
    } catch (error) {
      print(error);
      throw Exception('An error occurred');
    }
  }}

