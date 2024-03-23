import 'package:e_store/core/class/middelware.dart';
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
import 'package:e_store/view/screen/owner_screen/costumer_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/blocking_calender.dart';
import 'package:e_store/view/screen/splach_view.dart';
import 'package:e_store/view/screen/user_screen/add_appoint/add_appoint.dart';
import 'package:e_store/view/screen/comment_view.dart';
import 'package:e_store/view/screen/owner_screen/add_post/add_post_view.dart';
import 'package:e_store/view/screen/user_screen/home.dart';
import 'package:e_store/view/screen/user_screen/about_view.dart';
import 'package:e_store/view/screen/user_screen/my_appoint.dart';
import 'package:e_store/view/screen/on_boarding_screen/onboarding.dart';
import 'package:e_store/view/screen/owner_screen/booked_appointments.dart';
import 'package:e_store/view/screen/cleander.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/confirme_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owner_add_Service.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/owner_add_appoint.dart';
import 'package:e_store/view/screen/owner_screen/owner_home.dart';
import 'package:e_store/view/screen/owner_screen/owner_profile.dart';
import 'package:e_store/view/screen/user_profile.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>?routes=[
  GetPage(name:  "/", page: ()=>const SplachView()),
  // GetPage(name:  "/", page: ()=>   Home()),
  GetPage(name:  AppRoute.onBoarding, page: ()=>const OnBoardingView(),middlewares:[ MyMiddelware()]),
  GetPage(name:  AppRoute.login, page: ()=> LoginView()),
  GetPage(name:  AppRoute.signUp, page: ()=>  SignUpView()),
  GetPage(name:  AppRoute.forgetPassword, page: ()=> ForgetPasswordView()),
  GetPage(name:  AppRoute.verifyCodeResPas, page: ()=> VerifyCodeResPasView()),
  GetPage(name:  AppRoute.verifyCodeSignUp, page: ()=> VerifyCodeSignUpView()),
  GetPage(name:  AppRoute.resetPassword, page: ()=> ResetPasswordView()),
  GetPage(name:  AppRoute.successSignUp, page: ()=> SuccessSignUpView()),
  GetPage(name:  AppRoute.successRePas, page: ()=> SuccessRePasView()),
  GetPage(name:  AppRoute.home, page: ()=>  Home()),
  GetPage(name:  AppRoute.addappoint, page: ()=>  AddAppointView()),
  GetPage(name:  AppRoute.myappoint, page: ()=>  MyAppointView()),
  GetPage(name:  AppRoute.profile, page: ()=>  UserProfileView()),
  GetPage(name:  AppRoute.homeImp, page: ()=> const AboutView()),
  GetPage(name:  AppRoute.comment, page: ()=>   CommentPage()), 
  //owner pages
  GetPage(name:  AppRoute.ownerAddAppoint, page: ()=>  OwnerAddAppointView()),
  GetPage(name:  AppRoute.ownerAddService, page: ()=>   OwnerAddServiceView()),
  GetPage(name:  AppRoute.ownerProfile, page: ()=>   OwnerProfileView()),
  GetPage(name:  AppRoute.bookedAppoint, page: ()=>   BookedAppointmentsView()),
  GetPage(name:  AppRoute.ownerHome, page: ()=>   OwnerHome()),
  GetPage(name:  AppRoute.calendarPage, page: ()=>   CalendarPage()),
  GetPage(name:  AppRoute.confirmePage, page: ()=>   ConfirmeView()),
  GetPage(name:  AppRoute.addPost, page: ()=>   AddPost()),
  GetPage(name:  AppRoute.language, page: ()=>   LanguegeView()),
  GetPage(name:  AppRoute.blockingCalender, page: ()=>   BlockingCalender()),
  GetPage(name:  AppRoute.costumerView, page: ()=>   CostumerView()),
  
 
  
];

 