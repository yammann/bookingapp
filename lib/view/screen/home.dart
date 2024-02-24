import 'package:e_store/controller/data/fetch_user_data.dart';
import 'package:e_store/controller/home_controller.dart';
import 'package:e_store/core/class/status.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:e_store/view/screen/add_appoint/add_appoint.dart';
import 'package:e_store/view/screen/home_imp.dart';
import 'package:e_store/view/screen/my_appoint.dart';
import 'package:e_store/view/screen/user_profile.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> pages = [
    const HomeImp(),
    const UserProfileView(),
    const MyAppointView(),
    const AddAppointView()
  ];

  List appbarTitle=[
    "Amjad Jawad",
    "Profile",
    "My Appointment",
    "Add Appointment",
  ];
 

  @override
  Widget build(BuildContext context) {
    Get.put(FetchUserDataControllerImp());
    Get.put(HomeControllerImp());
    return GetBuilder<FetchUserDataControllerImp>(
      builder: (FetchUserDataControllerImp controller) {
        if (controller.status == Status.loading) {
          return Scaffold(
            body: Center(
              child: Lottie.asset("assets/lottie/loading.json",
                  height: 200, width: 200),
            ),
          );
        } else if (controller.status == Status.offLineFailure) {
          return const Scaffold(
            body: Center(
              child: Text("off Line failure"),
            ),
          );
        } else if (controller.status == Status.serverFailure) {
          return Scaffold(
            body: Center(
              child: Lottie.asset("assets/lottie/404error.json",
                  height: 50, width: 50),
            ),
          );
        } else if (controller.status == Status.failure) {
          return Scaffold(
            body: Center(
              child: Lottie.asset("assets/lottie/nodata.json",
                  height: 50, width: 50),
            ),
          );
        } else {
          return GetBuilder<HomeControllerImp>(
            builder: (controller1) {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: kOnBoardingP,
                    showUnselectedLabels: true,
                    unselectedItemColor: kOnBoardingFC,
                    currentIndex: controller1.currentIndex,
                    onTap: (value) {
                      controller1.currentPage(value);
                      print(value);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_rounded), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person_3), label: "Profile"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.list_alt_rounded),
                          label: "My Appointment"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_box_rounded),
                          label: "Add Appointment"),
                    ]),
                backgroundColor: kOnBoardingBG,
                appBar: AppBar(
                  backgroundColor: kOnBoardingBG,
                  centerTitle: true,
                  title:  Text("${appbarTitle[controller1.currentIndex]}"),
                ),
                body: Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child:pages[controller1.currentIndex],),
              );
            },
          );
        }
      },
    );
  }
}
