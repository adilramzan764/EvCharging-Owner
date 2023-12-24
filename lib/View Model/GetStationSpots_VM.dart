import 'package:car_charging/ApiServices/GetStationSpots_Api.dart';
import 'package:get/get.dart';

import '../Model/ChargingSpotModel.dart';

class GetStationSpots_VM extends GetxController {
  final GetStationSpots_Api _apiService = GetStationSpots_Api();

  RxBool isLoading = true.obs;
  RxList<dynamic> spots = <dynamic>[].obs; // Use GetX's RxList directly
  RxString errorMessage = ''.obs;

  Future<void> getSellerStationSpots() async {
    isLoading.value = true;

    try {
      final List<ChargingSpotModel> spotsResult = await _apiService.getSellerStationSpots();
      print(spotsResult.toString());
      spots.assignAll(spotsResult); // Use assignAll to update the RxList
      errorMessage.value = ''; // Clear any previous error message
    } catch (error) {
      // Handle error, show error message, etc.
      print(error);
      errorMessage.value = 'Error fetching spots: $error';
    }

    isLoading.value = false;
  }
}
