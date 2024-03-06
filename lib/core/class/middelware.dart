import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddelware extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.get("onBoarding") == true) {
      if (myServices.sharedPreferences.get("login") == true) {
        if (myServices.sharedPreferences.get("owner") == true) {
          print("1");
          return const RouteSettings(name: AppRoute.ownerHome);
        } else {
          print("2");
          return const RouteSettings(name: AppRoute.home);
        }
      } else {
        return const RouteSettings(name: AppRoute.login);
      }
    }
    return null;
  }
}
