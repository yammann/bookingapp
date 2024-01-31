import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
   const AppButton({super.key, required this.title,this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: 360, 
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: kOnBoardingP),
        child: Center(
          child: Text(title.tr),
        ),
      ),
    );
  }
}
