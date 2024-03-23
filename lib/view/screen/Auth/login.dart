import 'package:e_store/controller/Auth/login_controller.dart';
import 'package:e_store/core/function/exit_alert.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/Auth/widget/auth_appbar.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/social_media.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginControllerImp loginControllerImp= Get.put(LoginControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (v) {
          if (v) {
            return;
          }
          exitAlert();
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<LoginControllerImp>(
            builder: (LoginControllerImp controller) {
              return Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    AuthAppBar(
                      title: "LoginTitle".tr,
                    ),
                    const Spacer(flex: 1),
                    Text(
                      "Login1Text".tr,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Spacer(flex: 1),
                    Text(
                      "Login2Text".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(height: 2),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 1),
                    AuthTextFiled(
                      myController: controller.emailController,
                      valid: (val) {
                        return validation(val, 5, 50, Type.email);
                      },
                      keyboardType: TextInputType.emailAddress,
                      label: "EmailLabel".tr,
                      hint: "EmailHint".tr,
                      icon: const Icon(
                        Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 5),
                    AuthTextFiled(
                      myController: controller.passwordController,
                      valid: (val) {
                        return validation(val, 5, 50, Type.passowrd);
                      },
                      isObscure: controller.obscure,
                      label: "PasswordLabel".tr,
                      hint: "PasswordHint".tr,
                      icon: IconButton(
                          onPressed: () {
                            controller.obsure();
                          },
                          icon: controller.obscure
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          controller.navToForgetPassword();
                        },
                        child: Text(
                          "forget".tr,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    AppButton(
                      onTap: () {
                        controller.login();
                      },
                      title: "btnText".tr,
                    ),
                    const Spacer(flex: 1),
                   
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("bottomText".tr),
                          TextButton(
                            onPressed: () {
                              controller.navToSignUp();
                            },
                            child: Text(
                              "signBtnText".tr,
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
