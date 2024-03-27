import 'package:get/get.dart';

enum Type {
  userName,
  email,
  phoneNumber,
  passowrd,
  text,
  number,
}

validation(String? val, int min, int max, Type typy) {
  if (val == null || val.isEmpty) {
    return "Cant enter empty value".tr;
  } else {
    if (typy == Type.email) {
      if (!GetUtils.isEmail(val)) {
        return "Not Valid User Name".tr;
      }
    }

    if (typy == Type.phoneNumber) {
      if (!GetUtils.isPhoneNumber(val)) {
        return "Not Valid Phone Number".tr;
      }
    }

    if (typy == Type.userName) {
      if (!GetUtils.isUsername(val)) {
        return "Not Valid User Name".tr;
      }
    }

    if (typy == Type.text) {
      if (!GetUtils.isLengthBetween(val,1,200)) {
        return "Not Valid text".tr;
      }
    }

    if (typy == Type.number) {
      if (!GetUtils.isNum(val)) {
        return "Not Valid number".tr;
      }
    }

    if (val.length < min) {
      return "Value Cant be less than".tr+ min.toString();
    }

    if (val.length > max) {
      return "Value Cant be larger than".tr + max.toString();
    }
  }
}
