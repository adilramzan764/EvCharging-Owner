import 'package:car_charging/Model/StationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ApiServices/StationInfoSignup_Api.dart';
import '../View/Sign In/SignIn.dart';

class StationInfoSignupViewModel extends GetxController {
  final StationInfoSignupApi apiService = StationInfoSignupApi();

  var station = StationModel(userId: '', serviceHours: '', numberOfChargingSpots: '', perHourPrice: '', parkingPrice: '', amenities: [], namesOfChargingSpots: []).obs;

  // Method to add station
  Future<void> addStation(BuildContext context) async {
    try {
      // Validate required fields
      if (station.value.userId.isEmpty) {
        Get.snackbar('Error', 'User Id is not given');
        return;
      }

      if (station.value.serviceHours.isEmpty ||
          station.value.perHourPrice.isEmpty ||
          station.value.parkingPrice.isEmpty) {
        Get.snackbar('Error', 'Required Fields are not given');
        return;
      }

      // Make API request using ApiService
      final response = await apiService.addstation(stationModel: station.value);

      // Check the response status
      if (response.statusCode == 200) {
        // Show loading indicator

        // await Future.delayed(const Duration(seconds: 2));

        // await EasyLoading.dismiss();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignIn()), // Replace NewScreen with the screen you want to navigate to
              (Route<dynamic> route) => false, // This function defines the condition for removal
        );
        Get.snackbar('Success!', 'Account Created Successfully');
      } else {
        Get.snackbar('Error', 'Failed to add station. ${response.reasonPhrase}');
      }
    } catch (error) {
      print(error);
      Get.snackbar('Error', 'An error occurred');
    }
  }
}
