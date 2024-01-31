import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  navToLogin();
  navBack();
  navToVerify();
}

class SignUpControllerImp extends SignUpController {

  GlobalKey<FormState>formKey=GlobalKey();
  
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  @override
  navBack() {
    Get.back();
  }

  @override
  signUp() {
    var formState=formKey.currentState;
   if(formState!.validate()){
    print("valid");
     Get.offNamed(AppRoute.verifyCodeSignUp);
   }
   else{
    print("not valid");
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
}
