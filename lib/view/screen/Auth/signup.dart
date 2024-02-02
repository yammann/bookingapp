import 'package:e_store/controller/Auth/signup_controller.dart';
import 'package:e_store/core/function/exit_alert.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:e_store/view/screen/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) {
          return PopScope(
            canPop: false,
            onPopInvoked: (v){
              if(v){
                return;
              }
              exitAlert();
            },
            child: Form(
              key: controller.formKey,
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    expandedHeight: 100.0,
                    flexibleSpace: AuthAppBar(
                      title: 'Sign Up          ',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Welcome Back",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Sigin in with your emailand passwordor continue with social media",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(height: 2),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          AuthTextFiled(
                            valid: (val) {
                              return validation(val, 5, 50, Type.userName);
                            },
                            keyboardType: TextInputType.name,
                            label: "User Name",
                            hint: "Enter your User Name",
                            icon: const Icon(
                              Icons.person_3_outlined,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFiled(
                            valid: (val) {
                              return validation(val, 5, 50, Type.email);
                            },
                            keyboardType: TextInputType.emailAddress,
                            label: "Email",
                            hint: "Enter your email",
                            icon: const Icon(Icons.email_outlined),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFiled(
                            valid: (val) {
                              return validation(val, 5, 15, Type.phoneNumber);
                            },
                            keyboardType: TextInputType.phone,
                            label: "Phone Number",
                            hint: "Enter your Phone Number",
                            icon: const Icon(
                              Icons.phone_enabled_outlined,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<SignUpControllerImp>(
                  builder: (SignUpControllerImp controller) {
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
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            onTap: () {
                              controller.signUp();
                              // signUpControllerImp.navToVerify();
                            },
                            title: 'Sign Up',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Go to login "),
                              TextButton(
                                onPressed: () {
                                  controller.navToLogin();
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
