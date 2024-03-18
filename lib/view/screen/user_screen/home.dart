import 'package:e_store/controller/add_appoint/add_appoint_controller.dart';
import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/controller/data/fetch_user_data.dart';
import 'package:e_store/controller/home_controller.dart';
import 'package:e_store/controller/my_appointment_cpntroller.dart';
import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/class/handling_view.dart';
import 'package:e_store/view/screen/user_screen/widget/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final FetchUserDataControllerImp fetchUserDataControllerImp= Get.put(FetchUserDataControllerImp());

  final HomeControllerImp homeControllerImp= Get.put(HomeControllerImp());

  final AddAppointControllerImp addAppointControllerImp = Get.put(AddAppointControllerImp());

  final PostControllerImp postControllerImp = Get.put(PostControllerImp());

  final MyAppointmentControllerImp myAppointmentControllerImp = Get.put(MyAppointmentControllerImp());

  final NormalTodoListControllerImp normalTodoListControllerImp = Get.put(NormalTodoListControllerImp());

  final SpecialTodoListControllerImp specialTodoListControllerImp=Get.put(SpecialTodoListControllerImp());

  final UserProfileControllerImp userProfileControllerImp=Get.put(UserProfileControllerImp());

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<FetchUserDataControllerImp>(
      builder: (FetchUserDataControllerImp controller) {
        return HandlingView(
            status: controller.status, widget:  HomeBody());
      },
    );
  }
}


