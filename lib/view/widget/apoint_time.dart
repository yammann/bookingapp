import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ApointTime extends StatelessWidget {
  ApointTime({super.key, required this.dataList, required this.holiday});
  final List<dynamic> dataList;
  final bool holiday;
  final CalenderControllerImp calenderControllerImp =
      Get.put(CalenderControllerImp());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:holiday? const Center(child: Text("Holiday"),)
      : dataList.length<13
          ? Lottie.asset("assets/lottie/loading.json")
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    calenderControllerImp.changeSelectedTime(index);
                    if (dataList[index].state) {
                      print(Get.previousRoute);
                      if (Get.previousRoute == "/OwnerCalendarPage" || Get.previousRoute == "/ownerHome") {
                        Get.toNamed(AppRoute.ownerConfirme);
                      } else {
                        Get.toNamed(AppRoute.confirme);
                      }
                    } else {}
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: dataList[index].state
                            ? calenderControllerImp.selectedTime == index
                                ? kOnBoardingP
                                : kOnBoardingBG
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(dataList[index].time!),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
