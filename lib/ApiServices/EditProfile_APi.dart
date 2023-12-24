import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:car_charging/Model/Seller_Model.dart';
import 'package:car_charging/Model/SignUp_Model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/UserModel.dart';
import '../const/BaseURL.dart';

class EditProfile_APi {
  static Future<http.Response> updateseller(
    String userId,
    String firstName,
    String lastName,
    String email,
    String password,
    String phone,
    String profileImage,
  ) async {
    try {
      //
      // if (userId == null || user.userId!.isEmpty) {
      //   return http.Response('{"error":"userId is missing"}', 400);
      // }

      const String URL = "${baseUrl}sellerInfoUpdate";
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(URL),
      );

      print(URL);

      request.headers['Content-Type'] = 'application/json';
      request.fields['userId'] = userId;
      request.fields['firstname'] = firstName;
      request.fields['lastname'] = lastName;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['phone'] = phone;
      print(userId);
      File profileImageFile = File(profileImage);
      request.files.add(await http.MultipartFile.fromPath(
        'profileImage',
        profileImageFile.path,
      ));
      print(request.fields);

      var response = await request.send();
      var responseString = await http.Response.fromStream(response);

      print(response.reasonPhrase);
      print(responseString.body);

      return http.Response(responseString.body, response.statusCode ?? 500);
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }
}
