import 'package:e_store/core/services/services.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  bool isLastePage = false;

  int currentPage = 0;

  MyServices myServices=Get.find();

  late PageController pageController;
  @override
  onPageChanged(int index) {
    currentPage = index;
    if (currentPage == onBoardingList.length - 1) {
      isLastePage = true;
    } else {
      isLastePage = false;
    }
    update();
  }

  @override
  next() {
    if (currentPage == onBoardingList.length - 1) {
      isLastePage = true;
      myServices.sharedPreferences.setBool("onBoarding", true);
    } else {
      currentPage++;
      isLastePage = false;
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
