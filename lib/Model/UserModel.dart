import 'ChargingSpotModel.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String profileImage;
  String createdAt;
  String updatedAt;
  int v;
  String station;
  final List<ChargingSpotModel> spots;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.station,
    required this.spots,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var userJson = json['user'] ?? {};
    var spotsList = json['spots'] as List<dynamic>? ?? [];

    List<ChargingSpotModel> spots = spotsList
        .map((i) => ChargingSpotModel.fromJson(i as Map<String, dynamic>))
        .toList();

    return UserModel(
      id: userJson['_id'] ?? '',
      firstName: userJson['firstName'] ?? '',
      lastName: userJson['lastName'] ?? '',
      email: userJson['email'] ?? '',
      password: userJson['password'] ?? '',
      phone: userJson['phone'] ?? '',
      profileImage: userJson['profileImage'] ?? '',
      createdAt: userJson['createdAt'] ?? '',
      updatedAt: userJson['updatedAt'] ?? '',
      v: userJson['__v'] ?? 0,
      station: userJson['station'] ?? '',
      spots: spots,
    );
  }
}
