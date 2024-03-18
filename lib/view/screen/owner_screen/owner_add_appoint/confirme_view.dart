
import 'package:e_store/controller/add_appoint/confirme_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmeView extends StatelessWidget {
   ConfirmeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title: const Text("Confirme"),
      ),
      body: GetBuilder<ConfirmeControllerImp>(
        init:ConfirmeControllerImp() ,
        builder: (controller) {
          return Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: kOnBoardingBG,
                        borderRadius: BorderRadius.circular(15)),
                    child:  Column(
                      children: [
                        const Text(
                          "Your Apointment has been confermide",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const CircleAvatar(
                          radius: 150,
                          backgroundImage:
                              AssetImage("assets/images/logo-color.png"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 1,
                          color: kOnBoardingP,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Your Apointment",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        UserDetailesRow(title: "Date", value: controller.appointment[0].date!),
                        const SizedBox(height: 10),
                         UserDetailesRow(
                            title: "Time", value: "${controller.appointment[0].time.substring(0,6)} (${controller.duration} minute)"),
                        const SizedBox(height: 10),
                        UserDetailesRow(
                            title: "Detail",
                            value: controller.detail),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                AppButton(
                    title: "Confirme",
                    onTap: () {
                      controller.confirme();
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
