import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/image_assets.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Confirme extends StatelessWidget {
  const Confirme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title: const Text("Confirme"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: kOnBoardingBG,
                    borderRadius: BorderRadius.circular(15)),
                child: const Column(
                  children: [
                    Text(
                      "Your Apointment has been confermide",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage("assets/images/logo.jpeg"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                      color: kOnBoardingP,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Your Apointment",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    UserDetailesRow(title: "Date", value: "20.10.2024"),
                    SizedBox(height: 10),
                    const UserDetailesRow(title: "Time", value: "10:30 -> 11:30"),
                    SizedBox(height: 10),
                    UserDetailesRow(
                        title: "Detail",
                        value: "Valllllllllllllllllllllllllllllue"),
                        Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            AppButton(title: "Confirme",  
            onTap: () {
             Get.snackbar("Success", "Appointment Confermied ",
             backgroundColor: Colors.green[200],
             icon: Icon(Icons.check_circle_rounded,size: 30,color: Colors.green[900],)
             );
              Get.offAllNamed(AppRoute.home);
            }),
          ],
        ),
      ),
    );
  }
}
