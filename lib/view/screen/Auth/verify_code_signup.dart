import 'package:e_store/controller/Auth/verify_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCodeSignUpView extends StatelessWidget {
  VerifyCodeSignUpView({super.key});
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
              title: 'Verify Code          ',
            ),
            const Spacer(flex: 5),
            Text(
              "Please Enter the digit code send to qqqq@gmail.com",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
            OtpTextField(
              fieldWidth: 50,
              focusedBorderColor: kOnBoardingP,
              cursorColor: kOnBoardingP,
              filled: true,
              autoFocus: true,
              numberOfFields: 4,
              borderRadius: BorderRadius.circular(15),
              borderColor: kOnBoardingP,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                verifyControllerImp.navToSuccessSignUp();
              },
            ),
            const Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
