import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyController extends GetxController {
  verify();
  navToResetPassword();
  navToSuccessSignUp();
  navBack();
}

class VerifyControllerImp extends VerifyController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  verify() {
    throw UnimplementedError();
  }

  @override
  navToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }

  @override
  navToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
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
}
