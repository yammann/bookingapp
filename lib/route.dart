import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/screen/Auth/forget_password.dart';
import 'package:e_store/view/screen/Auth/login.dart';
import 'package:e_store/view/screen/Auth/reset_password.dart';
import 'package:e_store/view/screen/Auth/signup.dart';
import 'package:e_store/view/screen/Auth/success_re_pas.dart';
import 'package:e_store/view/screen/Auth/success_signup.dart';
import 'package:e_store/view/screen/Auth/verify_code_res_pas.dart';
import 'package:e_store/view/screen/Auth/verify_code_signup.dart';
import 'package:e_store/view/screen/language/language.dart';
import 'package:e_store/view/screen/on_boarding_screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //chooes language 
  AppRoute.language: (p0) => const LanguegeView(),
  //onBoarding
  AppRoute.onBoarding: (p0) => const OnBoardingView(),
  //auth
  AppRoute.login: (p0) =>  LoginView(),
  AppRoute.signUp: (p0) => const SignUpView(),
  AppRoute.forgetPassword:(p0) => ForgetPasswordView(),
  AppRoute.verifyCodeResPas:(p0) => VerifyCodeResPasView(),
  AppRoute.resetPassword:(p0) => ResetPasswordView(),
  AppRoute.successSignUp:(p0) => SuccessSignUpView(),
  AppRoute.successRePas:(p0) => SuccessRePasView(),
  AppRoute.verifyCodeSignUp:(p0) => VerifyCodeSignUpView(),
};
 