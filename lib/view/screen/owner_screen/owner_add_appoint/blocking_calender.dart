import 'package:e_store/controller/add_appoint/blocking_calender_controller.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/calendr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BlockingCalender extends StatelessWidget {
   BlockingCalender({super.key});
    UserProfileControllerImp userProfileControllerImp=Get.find();
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
          child: GetBuilder<BlockingCalenderControllerImp>(
            init: BlockingCalenderControllerImp(),
            builder: (controller) {
              return Stack(
                children: <Widget>[
                  Column(
                    children: [
                      MyCalender(
                        holidays:userProfileControllerImp.userModel.holidays!,
                        calendarFormat: CalendarFormat.month,
                        availableCalendarFormats: const {
                          CalendarFormat.month: "Month"
                        },
                        focusedDay: controller.isSelectedDay,
                        onDaySelected: (selectedDay, focusedDay) {
                          controller.onSelectedDay(selectedDay);
                          Get.defaultDialog(
                            backgroundColor: kOnBoardingBG,
                            title: "Alert".tr,
                            middleText:
                                "${"Are you sure you need blocking this day".tr} ${controller.isSelectedDay.toString().substring(0, 11)}",
                            onCancel: () {},
                            onConfirm: () {
                              controller.blockingDay();
                            },
                          );
                        },
                        endDay: DateTime.now().add(const Duration(days: 30)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                        color: kOnBoardingP,
                      ),
                    ],
                  ),
                  if (controller.isLoading) Positioned.fill(
                    child: Container(
                      color: Colors.black
                          .withOpacity(0.5), 
                      child: const Center(
                        child: CircularProgressIndicator(), 
                      ),
                    ),
                  ) 
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
