import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  check();
  navToVeriFiyCode();
  navBack();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  GlobalKey<FormState>formkey=GlobalKey();

  late TextEditingController emailController;
  late TextEditingController passwordController;

   @override
  navBack() {
    Get.back();
  }

  @override
  check() {
   var formState=formkey.currentState;
   if(formState!.validate()){
    
    Get.toNamed(AppRoute.verifyCodeResPas);
   }
   else{
   
   }
   
  }

  @override
  navToVeriFiyCode() {
     Get.toNamed(AppRoute.verifyCodeResPas);
  }

  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}