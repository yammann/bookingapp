import 'package:e_store/controller/Auth/verify_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/Auth/widget/auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCodeResPasView extends StatelessWidget {
  VerifyCodeResPasView({super.key});
  final VerifyControllerImp verifyControllerImp =
      Get.put(VerifyControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const AuthAppBar(
              title: 'Verification',
            ),
            const Spacer(flex: 5),
            Text(
              "A message will be sent to your email. Please check your email for change your password",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
            
            const Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
