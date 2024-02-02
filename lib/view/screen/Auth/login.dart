import 'package:e_store/controller/Auth/login_controller.dart';
import 'package:e_store/core/function/exit_alert.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:e_store/view/screen/widget/auth_text_filed.dart';
import 'package:e_store/view/screen/widget/social_media.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
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
          child: Form(
            key: loginControllerImp.formKey,
            child: Column(
              children: [
                const AuthAppBar(
                  title: 'Login          ',
                ),
                const Spacer(flex: 1),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(flex: 1),
                Text(
                  "Sigin in with your emailand passwordor continue with social media",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(height: 2),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                AuthTextFiled(
                  valid: (val) {
                    return validation(val, 5, 50, Type.email);
                  },
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  hint: "Enter your email",
                  icon: const Icon(
                    Icons.email_outlined,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GetBuilder<LoginControllerImp>(
                  builder: (LoginControllerImp controller) {
                    return AuthTextFiled(
                      valid: (val) {
                        return validation(val, 5, 50, Type.passowrd);
                      },
                      isObscure: controller.obscure,
                      label: "Password",
                      hint: "Enter your passowrd",
                      icon: IconButton(
                          onPressed: () {
                            controller.obsure();
                          },
                          icon: controller.obscure
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                    );
                  },
                ),
                const SizedBox(height: 10,),
                Center(
                  child: TextButton(
                    onPressed: () {
                      loginControllerImp.navToForgetPassword();
                    },
                    child: const Text(
                      "Forget password",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                AppButton(
                  onTap: () {
                    loginControllerImp.login();
                  },
                  title: 'Login',
                ),
                const Spacer(flex: 1),
                const SocialMedia(),
                const Spacer(flex: 1),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Dont have any account? "),
                      TextButton(
                        onPressed: () {
                          loginControllerImp.navToSignUp();
                        },
                        child: const Text(
                          "Sign up",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
