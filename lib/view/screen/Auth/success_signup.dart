import 'dart:math';

import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/screen/Auth/widget/auth_appbar.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUpView extends StatelessWidget {
  const SuccessSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            backgroundColor: kOnBoardingBG,
            centerTitle: true,
            title: Text("Success".tr),
          ),
      backgroundColor: kOnBoardingBG,
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Column(
          children: [
            const Spacer(flex: 1),
            const Center(
                child: Icon(
              Icons.check_circle_outline_rounded,
              size: 200,
              color: Colors.green,
            )),
            const SizedBox(
              width: 20,
            ),
            Text(
              "SuccessMSG".tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 4),
            AppButton(
                onTap: () {
                  Get.offAllNamed(AppRoute.login);
                },
                title: "signBottomText".tr),
          ],
        ),
      ),
    );
  }
}
