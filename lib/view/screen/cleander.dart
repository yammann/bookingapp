import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/usermodel.dart';
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
        title:  Text("Chooes Date".tr),
      ),
      body: Center(
        child: Container(
          width: Get.width > 600 ? 600 : double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: GetBuilder<CalenderControllerImp>(
            builder: (controller) {
              return Column(
                children: [
                  MyCalender(
                    holidays: controller.barber?.holidays??controller.userModel.holidays,
                    calendarFormat:CalendarFormat.week ,
                    availableCalendarFormats: const { CalendarFormat.week:"week"},
                    focusedDay: controller.isSelectedDay,
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.onSelectedDay(selectedDay);
                    },
                    endDay:controller.userModel.role!=Role.customer? DateTime.now().add(const Duration(days: 30)):DateTime.now().add(const Duration(days: 6)),
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
                        ?  Center(
                            child: Text("Holiday".tr),
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
      ),
    );
  }
}
