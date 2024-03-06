
import 'package:e_store/view/widget/custom_button.dart';
import 'package:e_store/view/screen/on_boarding_screen/widget/custom_slider.dart';
import 'package:e_store/view/screen/on_boarding_screen/widget/indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:10,right: 10,bottom: 10,top: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: const Column(
        children: [
          Expanded(
            flex: 5,
            child: CustomSlider()
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Spacer(flex: 1),
                Indecator(),
                Spacer(flex: 1),
                CustomButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
