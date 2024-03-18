import 'package:e_store/controller/home_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/function/exit_alert.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerHomeBody extends StatelessWidget {
  OwnerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
  
    return GetBuilder<HomeControllerImp>(
      init: HomeControllerImp(),
      builder: (controller1) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 50,
            padding: EdgeInsets.zero,
            color: kOnBoardingBG, // Set the color of the BottomAppBar as needed
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home_rounded,
                    size: 40,
                  ),
                  color: controller1.currentIndex == 0
                      ? kOnBoardingP
                      : kOnBoardingFC,
                  onPressed: () {
                    controller1.currentPage(0);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.list_alt_rounded,
                    size: 40,
                  ),
                  color: controller1.currentIndex == 1
                      ? kOnBoardingP
                      : kOnBoardingFC,
                  onPressed: () {
                    controller1.currentPage(1);
                  },
                ),
                const SizedBox(width: 40), // Adjust the space as needed
                IconButton(
                  icon: const Icon(
                    Icons.playlist_add_rounded,
                    size: 40,
                  ),
                  color: controller1.currentIndex == 2
                      ? kOnBoardingP
                      : kOnBoardingFC,
                  onPressed: () {
                    controller1.currentPage(2);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person_3,
                    size: 40,
                  ),
                  color: controller1.currentIndex == 3
                      ? kOnBoardingP
                      : kOnBoardingFC,
                  onPressed: () {
                    controller1.currentPage(3);
                  },
                ),
              ],
            ),
          ),
          backgroundColor: kOnBoardingBG,
          appBar: AppBar(
            backgroundColor: kOnBoardingBG,
            centerTitle: true,
            title: Text("${ownerAppbarTitle[controller1.currentIndex]}"),
          ),
          body: PopScope(
            canPop: false,
            onPopInvoked: (v) {
              if (v) {
                return;
              }
              exitAlert();
            },
            child: Container(
              width: double.infinity,
            
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              
              child: ownerHomePages[controller1.currentIndex],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller1.currentPage(4);
            },
            backgroundColor: kOnBoardingP,
            shape: const CircleBorder(
                side: BorderSide(width: 2, color: kOnBoardingBG)),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
