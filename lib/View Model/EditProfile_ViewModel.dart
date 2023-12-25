import 'dart:convert';
import 'dart:io';

import 'package:car_charging/View%20Model/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ApiServices/EditProfile_APi.dart';
import '../Model/Seller_Model.dart';
import '../Model/GeneralModel.dart';

class EditProfile_ViewModel extends GetxController {
  final EditProfile_APi _apiService = EditProfile_APi();
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

  Future<void> updateseller(

   String userId,
   String firstName,
   String lastName,
   String email,
   String password,
   String phone,
   String? profileImage, UserViewModel userViewModel,     BuildContext context) async {
    try {
      final response = await EditProfile_APi.updateseller(userId,firstName,lastName,email,password,phone,profileImage ?? "");

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        // var userData = SellerModel.fromJson(responseData);

        // sellerData(userData);
        print(sellerData.value.id);
        userViewModel.getUserData();

        Get.snackbar('Success!', 'Seller Updated Successfully');
      } else {
        print(response.body);
        var responseData = json.decode(response.body);
        generalModel(GeneralModel.fromJson(responseData));

        if (response.statusCode == 400) {
          Get.snackbar('Error!', generalModel.value.error ?? 'Bad Request');
        } else {
          Get.snackbar('Error!', 'Failed to update seller');
        }
      }
    } catch (e) {
      print('Error updating user: $e');
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
