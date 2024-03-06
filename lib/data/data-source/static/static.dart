import 'package:e_store/core/constants/image_assets.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/onboarding_model.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/view/screen/user_screen/about_view.dart';
import 'package:e_store/view/screen/add_appoint/add_appoint.dart';
import 'package:e_store/view/screen/add_appoint/normal_service_view.dart';
import 'package:e_store/view/screen/add_appoint/special_service_view.dart';
import 'package:e_store/view/screen/user_screen/home_imp_view.dart';
import 'package:e_store/view/screen/user_screen/my_appoint.dart';
import 'package:e_store/view/screen/owner_screen/booked_appointments.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/owner_normal_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/owner_special_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owne_normal_add_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owne_special_add_service_view.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_service/owner_add_Service.dart';
import 'package:e_store/view/screen/owner_screen/owner_add_appoint/owner_add_appoint.dart';
import 'package:e_store/view/screen/owner_screen/owner_profile.dart';
import 'package:e_store/view/screen/user_screen/user_profile.dart';
import 'package:flutter/material.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      contains: "1pc", title: "1pt", url: ImageAssets.onBoardingOneUrl),
  OnBoardingModel(
      contains: "2pc", title: "2pt", url: ImageAssets.onBoardingTowUrl),
  OnBoardingModel(
      contains: "3pc", title: "3pt", url: ImageAssets.onBoardingThreUrl),
];
List<ApointmentModel> apointmentList = [
  ApointmentModel(
      userName: null,
      userId: null,
      time: "09:00 - 09:30",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "09:30 - 10:00",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "10:00 - 10:30",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "10:30 - 11:00",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "11:00 - 11:30",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "11:30 - 12:00",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "12:00 - 12:30",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "12:30 - 13:00",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "13:00 - 13:30",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "13:30 - 14:00",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "14:00 - 14:30",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "14:30 - 15:00",
      detail: null,
      date: null),
  ApointmentModel(
      userName: null,
      userId: null,
      time: "15:00 - 15:30",
      detail: null,
      date: null),
];

List<Widget> homePages = [
  const HomeImpView(),
   UserProfileView(),
  const MyAppointView(),
  const AboutView(),
  const AddAppointView()
];
List<Widget> ownerHomePages = [
  const HomeImpView(),
  const BookedAppointmentsView(),
  const OwnerAddServiceView(),
   OwnerProfileView(),
  const OwnerAddAppointView()
];

List appbarTitle = [
  "Amjad Jawad",
  "Profile",
  "My Appointment",
  "About Us",
  "Add Appointment"
];
List ownerAppbarTitle = [
  "Amjad Jawad",
  "Booked Appointments",
  "Add Service",
  "Profile",
  "Add Appointment"
];

//  List<TodoItem>  todoItems = <TodoItem>[
//   TodoItem(label: 'Hair'),
//   TodoItem(label: 'Face Cereame'),
//   TodoItem(label: 'Option 3'),
//   TodoItem(label: 'Option 4'),
//   TodoItem(label: 'Option 5'),
// ];
List<Widget> servicePages = [
  NormalServiceView(),
  SpecialServiceView(),
];
List<Widget> ownerServicePages = [
  OwnerNormalServiceView(),
  OwnerSpecialServiceView(),
];
List<Widget> ownerAddServicePages = [
  const OwnerNormalAddServiceView(),
  const OwnerSpecialAddServiceView(),
];
