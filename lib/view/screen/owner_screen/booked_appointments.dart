import 'package:e_store/controller/booked_appointment_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/owner_screen/widget/booked_card.dart';
import 'package:e_store/view/widget/calendr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BookedAppointmentsView extends StatelessWidget {
  const BookedAppointmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: GetBuilder<BookedAppointmentControllerImp>(
        init: BookedAppointmentControllerImp(),
        builder: (controller) {
          return Column(
            children: [
              MyCalender(
                holidays:controller.userProfileControllerImp.userModel.holidays,
                calendarFormat: CalendarFormat.week,
                availableCalendarFormats: const {CalendarFormat.week: "week"},
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
                child: controller.holiday
                    ?  Center(
                        child: Text("Holiday".tr),
                      )
                    : ListView.builder(
                        itemCount: controller.bookedAppointList.length,
                        itemBuilder: (context, index) {
                          return BookedCard(
                            appointmentModel:
                                controller.bookedAppointList[index],
                            onTapIcon: () {
                              Get.defaultDialog(
                                title: "?",
                                onCancel: () {},
                                content: Column(
                                  children: [
                                     Text(
                                      "Do you want to make this appointment available to another customer or do you want to block the appointment completely?".tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            Get.back();
                                            Get.defaultDialog(
                                              title: "Alert".tr,
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              middleText:"You need to tell the customer".tr,
                                              middleTextStyle:const TextStyle(fontSize: 16),
                                              content: Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {controller.sendEmail(controller.bookedAppointList[index],false);},
                                                    child:
                                                         Text("Send mail".tr),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () { controller.call(controller.bookedAppointList[index],false);},
                                                    child:
                                                         Text("Call him".tr),
                                                  )
                                                ],
                                              ),
                                              onCancel: () {},
                                              textCancel: "Cancel".tr,
                                            );
                                          },
                                          child:  Text("Available".tr),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();   
                                            Get.defaultDialog(
                                              title: "Alert".tr,
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              middleText:
                                                  "You need to tell the customer".tr,
                                              middleTextStyle:
                                                  const TextStyle(fontSize: 16),
                                              onCancel: () {},
                                              textCancel: "Cancel".tr,
                                              content: Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {controller.sendEmail(controller.bookedAppointList[index],true);},
                                                    child:
                                                         Text("Send mail".tr),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () { controller.call(controller.bookedAppointList[index],true);},
                                                    child:
                                                         Text("Call him".tr),
                                                  )
                                                ],
                                              ),
                                              textConfirm: "Block".tr,
                                            );
                                          },
                                          child:  Text("Blocking".tr),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
