import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasControler extends GetxController {
  navBack();
  obsure();
}

class ResetPasControlerImp extends ResetPasControler {
  GlobalKey<FormState> formkey = GlobalKey();
  bool obscure = true;

  

  

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
