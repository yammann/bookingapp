import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasControler extends GetxController {
  navToSuccssRePas();
  save();
  navBack();
}

class ResetPasControlerImp extends ResetPasControler {

    GlobalKey<FormState>formkey=GlobalKey();


  @override
  navToSuccssRePas() {
    Get.offNamed(AppRoute.successRePas);
  }
  
  @override
  save() {
   var formState=formkey.currentState;
   if(formState!.validate()){
    print("valid");
    Get.offNamed(AppRoute.successRePas);
   }
   else{
    print("not valid");
   }
    
  }
   @override
  navBack() {
    Get.back();
  }
}