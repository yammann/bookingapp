import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class UserModel {
  UserModel({
    this.userName,
    required this.email,
    this.phone,
    required this.password,
    this.imgProfile="assets/images/person.jpeg", 
  });
  final String userId = uuid.v1();
  final String? userName;
  final String email;
  final String? phone;
  final String password;
  final String? imgProfile;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
