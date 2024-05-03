import 'package:e_store/controller/add_appoint/add_appoint_controller.dart';
import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/controller/data/fetch_user_data.dart';
import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/class/handling_view.dart';
import 'package:e_store/view/screen/owner_screen/widget/owner_home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerHome extends StatelessWidget {
OwnerHome({super.key});
    final FetchUserDataControllerImp fetchUserDataControllerImp = Get.put(FetchUserDataControllerImp());
    final UserProfileControllerImp userProfileControllerImp = Get.put(UserProfileControllerImp());
    final AddAppointControllerImp addAppointControllerImp = Get.put(AddAppointControllerImp());
    final PostControllerImp postControllerImp = Get.put(PostControllerImp());
    final SpecialTodoListControllerImp specialTodoListControllerImp = Get.put(SpecialTodoListControllerImp());
    final NormalTodoListControllerImp normalTodoListControllerImp = Get.put(NormalTodoListControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchUserDataControllerImp>(
      init: FetchUserDataControllerImp(),
      builder: (FetchUserDataControllerImp controller) {
        return HandlingView(status: controller.status, widget: OwnerHomeBody());
      },
    );
  }
}
