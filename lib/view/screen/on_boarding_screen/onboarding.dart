import 'package:e_store/controller/onboarding_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/widget/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kOnBoardingBG,
        body: OnBoardingBody()
      ),
    );
  }
}