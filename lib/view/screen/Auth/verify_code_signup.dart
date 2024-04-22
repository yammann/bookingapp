import 'package:e_store/controller/Auth/verify_controller.dart';
import 'package:e_store/core/constants/colors.dart';
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
              appBar: AppBar(
          backgroundColor: kOnBoardingBG,
          centerTitle: true,
          title: Text("Verification".tr,),
        ),
                body: Center(
                  child: Container(
                    width: Get.width > 600 ? 600 : double.infinity,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
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
                  ),
                ),
              );
      },
    );
  }
}
