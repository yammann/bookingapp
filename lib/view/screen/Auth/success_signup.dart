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
      body: Column(
        children: [
           AuthAppBar(title: "Success".tr),
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
            style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,
          ),
          const Spacer(flex: 4),
          AppButton(
              onTap: () {
                Get.offAllNamed(AppRoute.login);
              },
              title: "signBottomText".tr),
        ],
      ),
    );
  }
}
