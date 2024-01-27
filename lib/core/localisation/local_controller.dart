import 'package:e_store/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharPrefLang=="ar"){
       language=const Locale("ar");
    }
    else if(sharPrefLang=="en"){
      language=const Locale("en");
    }
    else{
      language=Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
