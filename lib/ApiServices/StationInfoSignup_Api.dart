import 'dart:convert';
import 'package:car_charging/Model/StationModel.dart';
import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class StationInfoSignupApi {
  Future<http.Response> addstation({
    required StationModel stationModel,
  }) async {
    final Map<String, dynamic> requestBody = {
      'userId': stationModel.userId,
      'serviceHours': stationModel.serviceHours,
      'numberOfChargingSpots': stationModel.numberOfChargingSpots,
      'perHourPrice': stationModel.perHourPrice,
      'parkingPrice': stationModel.parkingPrice,
      'amenities': stationModel.amenities,
      'namesOfChargingSpots': stationModel.namesOfChargingSpots,
    };

    final response = await http.post(
      Uri.parse('${baseUrl}sellerSignUpStation'), // replace with your actual endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    return response;
  }
}
