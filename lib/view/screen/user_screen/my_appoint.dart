import 'package:e_store/controller/my_appointment_cpntroller.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/view/widget/appoint_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyAppointView extends StatelessWidget {
  MyAppointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAppointmentControllerImp>(
      init: MyAppointmentControllerImp(),
      builder: (controller) {
        return StreamBuilder<List<AppointmentModel>>(
            stream: controller.appointmentsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child:Lottie.asset("assets/lottie/loading.json"));
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              List<AppointmentModel>? appointments = snapshot.data;

              if (appointments == null || appointments.isEmpty) {
                return Center(
                  child: Text("You don't have any appointments."),
                );
              }

              return ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return AppointCard(
                    appointmentModel: appointments[index],
                    onTapCancel: () {
                      Get.defaultDialog(
                        title: "Alert",
                        middleText:
                            "Are you sure you want to cancel your appointment?",
                        onCancel: () {},
                        onConfirm: () {
                          controller.cancelAppointment(
                            appointments[index].date!,
                            appointments[index].appointmentId!,
                          );
                        },
                      );
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
