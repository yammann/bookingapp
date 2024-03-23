import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApointTime extends StatelessWidget {
  ApointTime({super.key, required this.appointmentModel, required this.holiday, this.onTap, required this.index});
  final AppointmentModel appointmentModel;
  final bool holiday;
  final Function()? onTap;
  final int index;
  final CalenderControllerImp calenderControllerImp =
      Get.put(CalenderControllerImp());
  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap:onTap,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: appointmentModel.state&& !appointmentModel.isBlocked&&!appointmentModel.appointmentExceed
                            ? calenderControllerImp.selectedTime == index
                                ? kOnBoardingP
                                : kOnBoardingBG
                            :appointmentModel.isBlocked?Colors.red[200]
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(appointmentModel.time),
                    ),
                  ),
                );
  }
}
