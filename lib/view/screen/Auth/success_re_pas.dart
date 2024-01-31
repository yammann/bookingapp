import 'package:e_store/controller/Auth/signup_controller.dart';
import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRePasView extends StatelessWidget {
  SuccessRePasView({super.key});
  final SignUpControllerImp signUpControllerImp =
      Get.put(SignUpControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthAppBar(title: "Success                 "),
         const Spacer(flex: 1),
          const Center(
              child: Icon(
            Icons.check_circle_outline_rounded,
            size: 200,
            color: Colors.green,
          )),
          const SizedBox(
            width: 20,
          ),
          Text(
            "qqqqqqqqqqqqqqqqqqqqqqqq\nqqqqqqqqqqqqqqqqqqq\nqqqqqqqqqqqqq",
            style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,
          ),
          const Spacer(flex: 4),
          AppButton(
              onTap: () {
                signUpControllerImp.navToLogin();
              },
              title: "Go To Login"),
        ],
      ),
    );
  }
}
