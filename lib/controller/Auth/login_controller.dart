import 'package:e_store/core/class/auth.dart';
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
  bool obscure = true;
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  Auth auth=Get.find();

  @override
  login() async {
    var formState = formKey.currentState;
    if (formState!.validate()) {
        auth.login(emailController.text, passwordController.text);
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
    obscure = !obscure;
    update();
  }

 
}
