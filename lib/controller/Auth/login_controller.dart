import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  navToSignUp();
  navToForgetPassword();
  navBack();
  obsure();
}

class LoginControllerImp extends LoginController {

  bool obscure=true;
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  login() {
    var formState = formKey.currentState;
    if (formState!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  navToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  navToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  navBack() {
    Get.back();
  }
  
  @override
  obsure() {
    obscure=!obscure;
    update();
  }
}
