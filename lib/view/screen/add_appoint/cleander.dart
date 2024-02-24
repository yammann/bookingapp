import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/apoint_time.dart';
import 'package:e_store/view/widget/calendr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalenderControllerImp());
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title: const Text("Chooes Date"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: GetBuilder<CalenderControllerImp>(
          builder: (controller) {
            return Column(
              children: [
                MyCalender(
                  focusedDay: controller.isSelectedDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    controller.selectDay(selectedDay);
                    controller.getApointment(selectedDay.toString());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: kOnBoardingP,
                ),
                ApointTime(
                  dataList: controller.datalist,)
              ],
            );
          },
        ),
      ),
    );
  }
}
