import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/owner_screen/widget/booked_card.dart';
import 'package:e_store/view/widget/apoint_time.dart';
import 'package:e_store/view/widget/calendr.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedAppointmentsView extends StatelessWidget {
  const BookedAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalenderControllerImp());
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: GetBuilder<CalenderControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              MyCalender(
                focusedDay: controller.isSelectedDay,
                onDaySelected: (selectedDay, focusedDay) {
                    controller.onSelectedDay(selectedDay, focusedDay);
                  },
                endDay: DateTime.now().add(const Duration(days: 29)),
              ),
              const Divider(
                thickness: 1,
                color: kOnBoardingP,
              ),
             Expanded(
               child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                 return BookedCard();
               },),
             )
            ],
          );
        },
      ),
    );
  }
}
