import 'package:e_store/controller/booked_appointment_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/owner_screen/widget/booked_card.dart';
import 'package:e_store/view/widget/calendr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedAppointmentsView extends StatelessWidget {
  BookedAppointmentsView({super.key});

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
                    ? const Center(
                        child: Text("Holiday"),
                      )
                    : ListView.builder(
                        itemCount: controller.bookedAppointList.length,
                        itemBuilder: (context, index) {
                          return BookedCard(
                            appointmentModel: controller.bookedAppointList[index],
                            onTapIcon: () {
                              Get.defaultDialog(
                                title: "?",
                                onCancel: () {},
                                content: Column(
                                  children: [
                                    const Text(
                                      "Do you want to make this appointment available to another customer or do you want to block the appointment completely?",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            Get.defaultDialog(
                                              contentPadding: const EdgeInsets.all(20),
                                              middleText: "You need to tell the customer",
                                              middleTextStyle: const TextStyle(fontSize: 16),
                                              onCancel: () {},
                                              textCancel: "Cancel",
                                              onConfirm: () {
                                                controller.call(controller.bookedAppointList[index], false);
                                                Get.back(); // Close the dialog
                                              },
                                              textConfirm: "call",
                                            );
                                          },
                                          child: const Text("Available"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              contentPadding: const EdgeInsets.all(20),
                                              middleText: "You need to tell the customer",
                                              middleTextStyle: const TextStyle(fontSize: 16),
                                              onCancel: () {},
                                              textCancel: "Cancel",
                                              onConfirm: () {
                                                controller.call(controller.bookedAppointList[index], true);
                                                Get.back();
                                              },
                                              textConfirm: "Block",
                                            );
                                          },
                                          child: const Text("Blocking"),
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
