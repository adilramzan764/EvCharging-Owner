import 'dart:convert';

class SellerModel {
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String profileImage;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? v;

  SellerModel({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.profileImage,
     this.id,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory SellerModel.fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    Map<String, dynamic> savedUser = json['savedUser'] ?? {};

    return SellerModel(
      firstName: savedUser['firstName'] ?? '',
      lastName: savedUser['lastName'] ?? '',
      email: savedUser['email'] ?? '',
      password: savedUser['password'] ?? '',
      phone: savedUser['phone'] ?? '',
      profileImage: savedUser['profileImage'] ?? '',
      id: savedUser['_id'] ?? '',
      createdAt: savedUser['createdAt'] ?? '',
      updatedAt: savedUser['updatedAt'] ?? '',
      v: savedUser['__v']?.toString() ?? '0',
    );
  }
  String? getId(){
    return id;
  }
}

