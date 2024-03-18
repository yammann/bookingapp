


class UserModel {
  UserModel( {
    required this.userId,
    this.userName,
    required this.email,
    this.phone,
    required this.password,
    this.imgProfile="https://t4.ftcdn.net/jpg/01/07/43/45/240_F_107434511_iarF2z88c6Ds6AlgtwotHSAktWCdYOn7.jpg", 
  });
  final String userId;
  final String? userName;
  final String email;
  final String? phone;
  final String password;
  final String imgProfile;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      imgProfile: json["imgProfile"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'imgProfile':imgProfile,
    };
  }
}
