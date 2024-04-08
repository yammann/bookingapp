import 'package:e_store/core/constants/image_assets.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/onboarding_model.dart';
import 'package:e_store/view/screen/user_screen/about_view.dart';
import 'package:e_store/view/screen/user_screen/add_appoint/add_appoint.dart';
import 'package:e_store/view/screen/user_screen/add_appoint/chooes_barber.dart';
import 'package:e_store/view/screen/user_screen/add_appoint/special_service_view.dart';
import 'package:e_store/view/screen/user_screen/home_imp_view.dart';
import 'package:e_store/view/screen/user_screen/my_appoint.dart';
import 'package:e_store/view/screen/owner_screen/booked_appointments.dart';
import 'package:e_store/view/screen/normal_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/owner_special_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owne_normal_add_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owne_special_add_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owner_add_Service.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/owner_add_appoint.dart';
import 'package:e_store/view/screen/owner_screen/owner_profile.dart';
import 'package:e_store/view/screen/user_profile.dart';
import 'package:flutter/material.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      contains: "1pc", title: "1pt", url: ImageAssets.onBoardingOneUrl),
  OnBoardingModel(
      contains: "2pc", title: "2pt", url: ImageAssets.onBoardingTowUrl),
  OnBoardingModel(
      contains: "3pc", title: "3pt", url: ImageAssets.onBoardingThreUrl),
];
List<AppointmentModel> appointmentList = [
  AppointmentModel(time: "09:00 - 09:30"),
  AppointmentModel(time: "09:30 - 10:00"),
  AppointmentModel(time: "10:00 - 10:30"),
  AppointmentModel(time: "10:30 - 11:00"),
  AppointmentModel(time: "11:00 - 11:30"),
  AppointmentModel(time: "11:30 - 12:00"),
  AppointmentModel(time: "12:00 - 12:30"),
  AppointmentModel(time: "12:30 - 13:00"),
  AppointmentModel(time: "13:00 - 13:30"),
  AppointmentModel(time: "13:30 - 14:00"),
  AppointmentModel(time: "14:00 - 14:30"),
  AppointmentModel(time: "14:30 - 15:00"),
  AppointmentModel(time: "15:00 - 15:30"),
  AppointmentModel(time: "15:30 - 16:00"),
  AppointmentModel(time: "16:00 - 16:30"),
  AppointmentModel(time: "16:30 - 17:00"),
  AppointmentModel(time: "17:00 - 17:30"),
  AppointmentModel(time: "17:30 - 18:00"),
  AppointmentModel(time: "18:00 - 18:30"),
  AppointmentModel(time: "18:30 - 19:00"),
];

List<Widget> userHomePages = [
  HomeImpView(),
  MyAppointView(),  
  UserProfileView(),
  const AboutView(),
  ChooesBarberView(),
];
List<Widget> ownerHomePages = [
  HomeImpView(),
  BookedAppointmentsView(),
  OwnerAddServiceView(),
  OwnerProfileView(),
  OwnerAddAppointView()
];

List<Widget> barberHomePages = [
  HomeImpView(),
  BookedAppointmentsView(),
  OwnerAddServiceView(),
  UserProfileView(),
  OwnerAddAppointView()
];

List appbarTitle = [
  "home",
  "My Appointment",
  "Profile",
  "About Us",
  "Add Appointment"
];
List ownerAppbarTitle = [
  "home",
  "Booked Appointments",
  "Add Service",
  "Profile",
  "Add Appointment"
];

List barberAppbarTitle = [
  "home",
  "Booked Appointments",
  "Add Service",
  "Profile",
  "Add Appointment"
];

List<Widget> userServicePages = [
  NormalServiceView(),
  SpecialServiceView(),
];
List<Widget> ownerServicePages = [
  NormalServiceView(),
  OwnerSpecialServiceView(),
];

List<Widget> ownerAddServicePages = [
  OwnerNormalAddServiceView(),
  OwnerSpecialAddServiceView(),
];

String personPlaceholderImg = "";
String ownerUserId = "Bn37pPu1x2OLzv9aKrI9ZP7ov3H3";
String ownerPhoneNumber="+49 178 2696138";
String ownerTiktok="//www.tiktok.com/@amjad.jaw?_t=8krFHrMrCfF&_r=1";
String ownerInstagram= "//www.instagram.com/amjad.jwd?igsh=ZHpsMm1sejJ3ZzEz";
String logoImg="assets/images/logo-color.png";
String salonName="Yaman";