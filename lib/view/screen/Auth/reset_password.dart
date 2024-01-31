import 'package:e_store/controller/Auth/reset_pas_controller.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:e_store/view/screen/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final ResetPasControlerImp resetPasControlerImp =
      Get.put(ResetPasControlerImp());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key:resetPasControlerImp.formkey ,
          child: Column(
            children: [
              const AuthAppBar(
                title: 'Reset Password          ',
              ),
              const Spacer(flex: 2),
              AuthTextFiled(
                valid: (val) {
                  return validation(val, 5, 50, Type.passowrd);
                },
                 isObscure: true,
                label: "New Password",
                hint: "Enter your New Password",
                icon: const Icon(
                  Icons.lock_outline_rounded,
                ),
              ),
              const Spacer(flex: 1),
              AuthTextFiled(
                valid: (val) {
                  return validation(val, 5, 50, Type.passowrd);
                },
                isObscure: true,
                label: "Re New Password",
                hint: "Re Enter your New Password",
                icon: const Icon(Icons.lock_outline_rounded),
              ),
              const Spacer(flex: 2),
              AppButton(
                onTap: () {
                  resetPasControlerImp.save();
                },
                title: 'Save',
              ),
              const Spacer(flex: 20),
            ],
          ),
        ),
      ),
    );
  }
}
