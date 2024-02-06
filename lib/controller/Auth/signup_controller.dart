import 'package:e_store/core/constants/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isVerifyed=false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  @override
  navBack() {
    Get.back();
  }

  @override
  signUp() async {
    var formState = formKey.currentState;
    if (formState!.validate()) {
      try {
        final UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        credential.user!.sendEmailVerification();
        User user = credential.user!;
        isVerifyed=user.emailVerified;
        print("User signed up: ${user.uid}");
        print(user.emailVerified);

        Get.offNamed(AppRoute.login);
      } on Exception catch (e) {
        print("Signup failed: $e");
      }
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
