
import 'Seller_Model.dart';

class SignUp_Model {
  final String? message;
  final SellerModel? savedUser;

  final String? error;

  SignUp_Model({this.message, this.error,this.savedUser});



  factory SignUp_Model.fromJson(Map<dynamic, dynamic> json) {
    return SignUp_Model(
      message: json['message'],
      error: json['error'],
      savedUser: SellerModel.fromJson(json['savedUser']),



    );
  }
  Map<String, dynamic> toJson() {
    if (error != null) {
      return {
        'error': error,
      };
    } else if (message != null) {
      return {
        'message': message,
      };
    } else {
      throw Exception("UserResponse should have either 'message' or 'error'.");
    }
  }
}