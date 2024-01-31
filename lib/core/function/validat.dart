import 'package:get/get.dart';

enum Type {
  userName,
  email,
  phoneNumber,
  passowrd,
}

validation(String? val, int min, int max, Type typy) {
  if (val == null || val.isEmpty) {
    return "Cant enter empty value";
  } else {
    if (typy == Type.email) {
      if (!GetUtils.isEmail(val)) {
        return "Not Valid User Name";
      }
    }

    if (typy == Type.phoneNumber) {
      if (!GetUtils.isPhoneNumber(val)) {
        return "Not Valid Phone Number ";
      }
    }

    if (typy == Type.userName) {
      if (!GetUtils.isUsername(val)) {
        return "Not Valid User Name";
      }
    }

    if (val.length < min) {
      return "Value Cant be less than $min";
    }

    if (val.length > max) {
      return "Value Cant be larger than $max";
    }
  }
}
