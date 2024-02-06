import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasControler extends GetxController {
  navToSuccssRePas();
  save();
  navBack();
  obsure();
}

class ResetPasControlerImp extends ResetPasControler {
  GlobalKey<FormState> formkey = GlobalKey();
  bool obscure = true;

  @override
  navToSuccssRePas() {
    Get.offNamed(AppRoute.successRePas);
  }

  @override
  save() {
    var formState = formkey.currentState;
    if (formState!.validate()) {
      Get.offNamed(AppRoute.successRePas);
    } 
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
