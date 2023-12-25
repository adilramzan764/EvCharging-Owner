import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ApiServices/EditProfile_APi.dart';
import '../Model/Seller_Model.dart';
import '../Model/GeneralModel.dart';

class EditProfileViewModel extends GetxController {
  final EditProfileApi _apiService = EditProfileApi();
  var generalModel = GeneralModel().obs;
  var sellerData = SellerModel(
    userId: '',
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    phone: '',
    profileImage: '',
    id: '',
    createdAt: '',
    updatedAt: '',
    v: '0',
  ).obs;

  Future<void> updateSeller(
      String userId,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String profileImage,
      BuildContext context,
      ) async {
    try {
      await EasyLoading.show(status: 'Updating...');

      await _apiService.updateProfile(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        profileImagePath: profileImage,
      );

    } catch (e) {
      print('Error updating user: $e');
      Get.snackbar('Error!', 'Failed to update seller');
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
