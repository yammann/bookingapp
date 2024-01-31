import 'package:e_store/core/constants/them_data.dart';
import 'package:e_store/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData themeData=englishThemeData;

  changeLang(String langCode) {
    Locale locale = Locale(langCode); 
    myServices.sharedPreferences.setString("lang", langCode);
    themeData=langCode=="ar"?arabicThemeData:englishThemeData;
    Get.changeTheme(themeData);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharPrefLang=="ar"){
       language=const Locale("ar");
       themeData=arabicThemeData;
    }
    else if(sharPrefLang=="en"){
      language=const Locale("en");
      themeData=englishThemeData;
    }
    else{
      language=Locale(Get.deviceLocale!.languageCode);
      themeData=englishThemeData;
    }
    super.onInit();
  }
}
