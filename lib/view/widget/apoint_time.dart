import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ApointTime extends StatelessWidget {
  ApointTime({super.key, required this.dataList});
  final List<dynamic> dataList;
  final CalenderControllerImp calenderControllerImp =
      Get.put(CalenderControllerImp());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: dataList.length < 13
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
                      Get.toNamed(AppRoute.confirme);
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
