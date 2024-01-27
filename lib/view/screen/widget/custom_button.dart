import 'package:e_store/controller/onboarding_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => GestureDetector(
         onTap: () {
          controller.next();
        },
        child: Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: kOnBoardingP),
          child: Center(
            child: controller.isLastePage
                ? const Text("Got it")
                : const Text("Continue"),
          ),
        ),
      ),
    );
  }
}
