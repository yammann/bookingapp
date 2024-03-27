import 'package:e_store/core/localisation/local_controller.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguegeView extends GetView<LocalController> {
  const LanguegeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("chooes lang".tr,
              style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          AppButton(
            title: "ar".tr,
            onTap: () {
              controller.changeLang("ar");
              Get.back();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            title: "en".tr,
            onTap: () {
              controller.changeLang("en");
              Get.back();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            title: "gr".tr,
            onTap: () {
              controller.changeLang("gr");
              Get.back();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            title: "tr".tr,
            onTap: () {
              controller.changeLang("tr");
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
