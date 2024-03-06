import 'package:e_store/controller/Auth/forget_password_controller.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/Auth/widget/auth_appbar.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  final ForgetPasswordControllerImp forgetPasswordControllerImp =
      Get.put(ForgetPasswordControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            AuthAppBar(
              title: "RPtitle".tr,
            ),
            const Spacer(flex: 1),
            Text(
              "RPtext".tr,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
            GetBuilder<ForgetPasswordControllerImp>(
              builder: (controller) {
                return Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Form(
                        key: forgetPasswordControllerImp.formkey,
                        child: AuthTextFiled(
                          myController: controller.emailController,
                          valid: (val) {
                            return validation(val, 5, 50, Type.email);
                          },
                          label: "EmailLabel".tr,
                          hint: "EmailHint".tr,
                          icon: const Icon(
                            Icons.email_outlined,
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      AppButton(
                        onTap: () {
                          forgetPasswordControllerImp
                              .resetPassword(controller.emailController.text);
                        },
                        title: "RPbtn".tr,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
