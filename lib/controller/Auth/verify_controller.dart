import 'dart:async';

import 'package:e_store/controller/Auth/signup_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyController extends GetxController {
  verify();
  navToSuccessSignUp();
  navBack();
}

class VerifyControllerImp extends VerifyController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late User user;

  bool isVerifyed = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late Timer timer;

  final SignUpControllerImp signUpControllerImp =
      Get.put(SignUpControllerImp());

  @override
  verify() async {
    await user.reload();
    user = auth.currentUser!;

    if (user.emailVerified) {
      // Email is verified, navigate to the next screen or perform desired action
      print('Email is verified. Navigate to the next screen.');
      isVerifyed = true;
      update();
      timer.cancel();
      // Get.offNamed(AppRoute.login);
    } else {
     
      print('Email is not verified. Please check your email.');
    }
  }

  
 

  @override
  navToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    user = auth.currentUser!;
    user.reload();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {verify();});
     
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  navBack() {
    Get.back();
  }
  
 
}
