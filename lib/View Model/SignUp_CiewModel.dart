import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiServices/SignUpApi.dart';
import '../Model/Seller_Model.dart';
import '../Model/SignUp_Model.dart';
import '../Utils/Widgets/SnackBarManager.dart';
import '../View/Sign Up/StationInfo.dart';

class SignUp_ViewModel extends GetxController {
  final SignUpApi _apiService = SignUpApi();
  var signupModel = SignUp_Model().obs;
  // final StreamController<String> _responseStreamController = StreamController<String>();

  // Stream<String> get responseStream => _responseStreamController.stream;

  var sellerData = SellerModel(
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

  Future<void> createUser(SellerModel user, BuildContext context) async {
    try {
      final createdUser = await SignUpApi.sellerSignup(
        SignUp_Model(
          savedUser: SellerModel(
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            password: user.password,
            phone: user.phone,
            profileImage: user.profileImage,
            id: user.id,

          ),
        ),
      );

      if (createdUser.statusCode == 200) {



        // Access the 'id' property from the parsed JSON
        // Map<String, dynamic> responseBody = json.decode(await createdUser.stream.bytesToString());

        // Create a SellerModel instance from the response
        // SellerModel userModel = SellerModel.fromJson(responseBody['savedUser']);

        // Access the user ID using the getId() method
        // String? userId = userModel.getId();


        // print('created user id' +userId!);
        var responsedata = await createdUser.stream.bytesToString() ;
        print('Response: $responsedata');

        var userData = SellerModel.fromJson(responsedata);
        sellerData(userData);
print(sellerData.value.id);
        Get.to(() => StationInfo(signup_userid: sellerData.value.id!,));

        // Show loading indicator
        // await EasyLoading.show(
        //   status: 'Almost there...',
        //   maskType: EasyLoadingMaskType.black,
        // );
        // await Future.delayed(const Duration(seconds: 2));
        //
        // await EasyLoading.dismiss();


        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => SignIn()), // Replace NewScreen with the screen you want to navigate to
        //       (Route<dynamic> route) => false, // This function defines the condition for removal
        // );
        Get.snackbar('Success!', 'Account Created Successfully');

      } else {
        if(createdUser.reasonPhrase=='Conflict')
          SnackbarManager.showSnackbar(title: 'Error!', message: 'Email already registered');
        else if(createdUser.reasonPhrase=='Bad Request')
          SnackbarManager.showSnackbar(title: 'Error!', message: 'Please fill in all required fields', context: context);


        // Get.snackbar('Error', '. ${createdUser.reasonPhrase}');
      }

    } catch (e) {
      // Specific error handling based on exception type
      print('Error creating user: $e');
    } finally {
      // isLoading(false);
    }
  }

  @override
  void dispose() {
    // _responseStreamController.close();
    super.dispose();
  }
}