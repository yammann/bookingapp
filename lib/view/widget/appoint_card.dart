import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointCard extends StatelessWidget {
  const AppointCard({
    super.key, required this.appointmentModel, this.onTapCancel,
  });
final AppointmentModel appointmentModel;
final Function()? onTapCancel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:appointmentModel.isBlocked?kWorrningSnackbar: kOnBoardingBG,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetailesRow(
                  title: "Date".tr, value: appointmentModel.date!),
              const SizedBox(height: 10),
              UserDetailesRow(
                  title: "Time".tr, value: "${appointmentModel.time.substring(0,6)} (${appointmentModel.duration} ${"minute".tr})"),
              const SizedBox(height: 10),
              UserDetailesRow(
                  title: "barber", value: "${appointmentModel.barberName}"),
              const SizedBox(height: 10),
              UserDetailesRow(
                  title: "Detail".tr, value: appointmentModel.detail! ),
              const SizedBox(height: 10),
               UserDetailesRow(
                  title: "State".tr, value: !appointmentModel.state&&!appointmentModel.isBlocked?"Activeti".tr:"is blocked".tr ),
              const SizedBox(height: 10),
            ],
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  15), // Adjust the value as needed
            ),
            elevation: 0,
            color: const Color.fromARGB(255, 255, 111, 109),
            onPressed: onTapCancel,
            child:  Text("Cancel".tr),
          ),
        ],
      ),
    );
  }
}