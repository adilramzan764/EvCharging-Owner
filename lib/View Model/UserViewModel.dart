import 'dart:convert';

import 'package:get/get.dart';
import '../ApiServices/GetSellerInfo_Api.dart';
import '../Model/ChargingSpotModel.dart';
import '../Model/UserModel.dart';

class UserViewModel extends GetxController {
  var userExists = UserModel(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    phone: '',
    profileImage: '',
    createdAt: '',
    updatedAt: '',
    v: 0,
    station: '',
    spots: [],
  ).obs;

  Future<void> getUserData() async {
    try {
      final response = await GetSellerinfo_Api.getUserData();

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        var userData = UserModel.fromJson(responseData);

        userExists.value = userData;
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to perform API call: $e');
    }
  }
}
