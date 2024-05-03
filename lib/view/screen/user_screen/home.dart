import 'package:e_store/controller/add_appoint/chooes_barber_controler.dart';
import 'package:e_store/controller/data/fetch_user_data.dart';
import 'package:e_store/controller/home_controller.dart';
import 'package:e_store/controller/my_appointment_controller.dart';
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

  final ChooesBarberControllerImp chooesBarberControllerImp=Get.put(ChooesBarberControllerImp());

  final PostControllerImp postControllerImp = Get.put(PostControllerImp());

  final MyAppointmentControllerImp myAppointmentControllerImp = Get.put(MyAppointmentControllerImp());

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


