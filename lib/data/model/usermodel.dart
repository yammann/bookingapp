enum Role {
  barber,
  customer,
  owner,
}

class UserModel {
  UserModel({
    required this.userId,
    this.userName,
    required this.email,
    this.phone,
    required this.password,
    this.imgProfile = "https://t4.ftcdn.net/jpg/01/07/43/45/240_F_107434511_iarF2z88c6Ds6AlgtwotHSAktWCdYOn7.jpg",
    this.role = Role.customer, 
    this.holidays,
  });

  final String userId;
  final String? userName;
  final String email;
  final String? phone;
  final String password;
  final String imgProfile;
  final Role role;
  final List<dynamic>? holidays;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      imgProfile: json['imgProfile'],
      role: Role.values.firstWhere((e) => e.toString().split('.').last == json['role']),
      holidays: json['holidays'] != null ? List<dynamic>.from(json['holidays']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'imgProfile': imgProfile,
      'role': role.toString().split('.').last,
      'holidays': holidays,
    };
  }
}
