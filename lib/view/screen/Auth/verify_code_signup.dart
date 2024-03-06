import 'package:e_store/controller/Auth/verify_controller.dart';
import 'package:e_store/view/screen/Auth/success_signup.dart';
import 'package:e_store/view/screen/Auth/widget/auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpView extends StatelessWidget {
  VerifyCodeSignUpView({super.key});

  final VerifyControllerImp verifyControllerImp =
      Get.put(VerifyControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyControllerImp>(
      builder: (VerifyControllerImp controller) {
        return controller.isVerifyed
            ? const SuccessSignUpView()
            : Scaffold(
                body: Padding(
                  padding:  const EdgeInsets.all(15),
                  child: Column(
                    children: [
                       AuthAppBar(
                        title: "Verification".tr,
                      ),
                      const Spacer(flex: 1),
                      Text(
                        "VerificationMSG".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(height: 2),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 1),
                     ],
                  ),
                ),
              );
      },
    );
  }
}
