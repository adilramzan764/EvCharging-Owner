import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:car_charging/Model/Seller_Model.dart';
import 'package:car_charging/Model/SignUp_Model.dart';
import 'package:http/http.dart' as http;
import '../Model/UserModel.dart';
import '../const/BaseURL.dart';

class SignUpApi {
   static Future<http.StreamedResponse> sellerSignup(SignUp_Model user) async {
    try {
      const String URL = "${baseUrl}sellerSignUpPersonal";
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(URL),
      );

      request.headers['Content-Type'] = 'multipart/form-data';
      request.fields['firstname'] = user.savedUser!.firstName;
      request.fields['lastname'] = user.savedUser!.lastName;
      request.fields['email'] = user.savedUser!.email;
      request.fields['password'] = user.savedUser!.password;
      request.fields['phone'] = user.savedUser!.phone;
      // request.fields['_id'] = user.savedUser!.id!;
      // request.fields['createdAt'] = user.savedUser!.createdAt!;
      // request.fields['updatedAt'] = user.savedUser!.updatedAt!;
      // request.fields['__v'] = user.savedUser!.v!;



      File profileImageFile = File(user.savedUser!.profileImage);
      request.files.add(await http.MultipartFile.fromPath(
        'profileImage',
        profileImageFile.path,
      ));

      var response = await request.send();


      print(response.reasonPhrase);
      // var responseString = await response.stream.bytesToString();



      // var responseData = json.decode(responseString);
      //
      // var userData = SellerModel.fromJson(responseData['savedUser']);
      // print('sign up key'+userData.id.toString());
      // print('Response: $responseString');

      return response;
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }
}
