import 'package:e_store/core/class/auth.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  navToLogin();
  navBack();
  navToVerify();
  obsure();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscure = true;
  bool isVerifyed = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  Auth auth = Get.find();
  @override
  navBack() {
    Get.back();
  }

  @override
  signUp() async {
    var formState = formKey.currentState;
    if (formState!.validate()) {
      auth.signUp(UserModel(
          userName: userNameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          password: passwordController.text));
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  navToVerify() {
    Get.offNamed(AppRoute.verifyCodeSignUp);
  }

  @override
  navToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  obsure() {
    obscure = !obscure;
    update();
  }
}
