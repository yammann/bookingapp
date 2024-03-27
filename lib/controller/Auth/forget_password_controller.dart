import 'package:e_store/core/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  resetPassword(String email);
  navBack();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formkey = GlobalKey();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  navBack() {
    Get.back();
  }

  @override
  resetPassword(String email) async {
    var formState = formkey.currentState;
    if (formState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.snackbar("SBtitle".tr,
           "SBtext".tr,
            duration: const Duration(seconds: 10),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kOnBoardingBG,
            padding: const EdgeInsets.all(20));
      } catch (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            Get.snackbar("Warning".tr, "NoUserFound".tr,
                snackPosition: SnackPosition.BOTTOM);
          } else {
             Get.snackbar( "Warning".tr, "error".tr,
                snackPosition: SnackPosition.BOTTOM);
          }
        }
      }
    }
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
}
