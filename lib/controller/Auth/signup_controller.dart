import 'package:e_store/core/class/auth.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class SignUpController extends GetxController {
  signUp();
  navToLogin();
  navBack();
  navToVerify();
  obsure();
}

class SignUpControllerImp extends SignUpController {
  final MaskTextInputFormatter phoneNumberFormatter = MaskTextInputFormatter(
    mask: '###-###-####', // Customize the mask as needed
    filter: {"#": RegExp(r'[0-9]')},
  );
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
      auth.signUp(passwordController.text,phoneNumberController.text,emailController.text,userNameController.text,);
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
