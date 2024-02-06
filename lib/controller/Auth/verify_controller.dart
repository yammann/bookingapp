import 'package:e_store/controller/Auth/signup_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyController extends GetxController {
  verify();
  navToResetPassword();
  navToSuccessSignUp();
  navBack();
}

class VerifyControllerImp extends VerifyController {


  

  bool isVerifyed=false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final SignUpControllerImp signUpControllerImp =
      Get.put(SignUpControllerImp());

  @override
  verify() async{
    final User? user = FirebaseAuth.instance.currentUser;
    isVerifyed=user!.emailVerified;
    print("1${user.emailVerified}");
    
    print("ww${signUpControllerImp.isVerifyed}");
    update();
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
