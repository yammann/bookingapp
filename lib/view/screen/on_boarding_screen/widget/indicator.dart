import 'package:e_store/controller/onboarding_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indecator extends StatelessWidget {
  const Indecator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onBoardingList.length,
          (index) => AnimatedContainer(
            height: 8,
            width: controller.currentPage==index?16:8,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: controller.currentPage==index?kOnBoardingP: kOnBoardingBG),
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
