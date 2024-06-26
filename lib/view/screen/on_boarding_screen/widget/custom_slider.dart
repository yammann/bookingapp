import 'package:e_store/controller/onboarding_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            "${onBoardingList[index].title}".tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 1),
         Expanded(
          flex: 3,
           child: Image.asset(
                    "${onBoardingList[index].url}",
                    fit: BoxFit.fill,
                  ),
         ),
          const Spacer(flex: 1),
          Text(
            "${onBoardingList[index].contains}".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 3,
              color: kOnBoardingFC,
            ),
          ),
        ],
      ),
    );
  }
}
