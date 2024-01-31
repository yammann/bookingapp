import 'package:e_store/controller/Auth/forget_password_controller.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:e_store/view/screen/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  final ForgetPasswordControllerImp forgetPasswordControllerImp = Get.put(ForgetPasswordControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const AuthAppBar(
              title: 'Forget Passowrd          ',
            ),
            const Spacer(flex: 1),
            Text(
              "Check Code",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(flex: 1),
            Text(
              "Please Enter your email Address to recive a verification code",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
             Form(
             key:forgetPasswordControllerImp.formkey ,
               child: AuthTextFiled(
                valid: (val) {
                  return validation(val, 5, 50, Type.email);
                },
                label: "Email",
                hint: "Enter your email",
                icon: const Icon(
                  Icons.email_outlined,
                ),
                           ),
             ),
            const Spacer(flex: 1),
             AppButton(
              onTap: (){
                forgetPasswordControllerImp.check();
              },
              title: 'Check',
            ),
            const Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
