import 'package:e_store/controller/my_appointment_controller.dart';
import 'package:e_store/view/widget/appoint_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppointView extends StatelessWidget {
  MyAppointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAppointmentControllerImp>(
      init: MyAppointmentControllerImp(),
      builder: (controller) {
        return controller.bookedAppointList.isEmpty
            ? Center(
                child: Text("You don't have any appointments.".tr),
              )
            : ListView.builder(
                itemCount: controller.bookedAppointList.length,
                itemBuilder: (context, index) {
                  return AppointCard(
                    appointmentModel: controller.bookedAppointList[index],
                    onTapCancel: () {
                      Get.defaultDialog(
                        title: "Alert".tr,
                        middleText:
                            "Are you sure you want to cancel your appointment?"
                                .tr,
                        onCancel: () {},
                        onConfirm: () {
                          controller.cancelAppointment(
                              controller.bookedAppointList[index]);
                        },
                      );
                    },
                  );
                },
              );
      },
    );
  }
}
