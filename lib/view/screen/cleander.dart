import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/view/widget/apoint_time.dart';
import 'package:e_store/view/widget/calendr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});
  
  final CalenderControllerImp calenderControllerImp =
      Get.put(CalenderControllerImp());

  @override
  Widget build(BuildContext context) {
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
          init: CalenderControllerImp(),
          builder: (controller) {
            return Column(
              children: [
                MyCalender(
                  calendarFormat: CalendarFormat.week,
                  availableCalendarFormats: const { CalendarFormat.week:"week"},
                  focusedDay: controller.isSelectedDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    controller.onSelectedDay(selectedDay);
                  },
                  endDay:controller.currentUser.uid==ownerUserId? DateTime.now().add(const Duration(days: 30)):DateTime.now().add(const Duration(days: 6)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: kOnBoardingP,
                ),
                Expanded(
                  child: controller.holiday
                      ? const Center(
                          child: Text("Holiday"),
                        )
                      : controller.upAppointmentlist.length < 13
                          ? Lottie.asset("assets/lottie/loading.json")
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: controller.upAppointmentlist.length,
                              itemBuilder: (context, index) {
                                return ApointTime(
                                  appointmentModel:
                                      controller.upAppointmentlist[index],
                                  holiday: controller.holiday,
                                  index: index,
                                  onTap: () {
                                    controller.onSelectTime(index);
                                  },
                                );
                              },
                            ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
