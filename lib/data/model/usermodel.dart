import 'package:uuid/uuid.dart';

var uuid = const Uuid();


class UserModel {
  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });
  final String userId=uuid.v1();
  final String userName;
  final String email;
  final String phone;
  final String password;

   factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}



