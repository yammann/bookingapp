import 'package:e_store/controller/add_appoint/add_appoint_controller.dart';
import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/view/widget/double_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerAddAppointView extends StatelessWidget {
  const OwnerAddAppointView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NormalTodoListControllerImp());
    Get.put(SpecialTodoListControllerImp());
    final AddAppointControllerImp addAppointControllerImp =
        Get.put(AddAppointControllerImp());
    return GetBuilder<AddAppointControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            DoubleButton(
              onTapNormal: () {
                addAppointControllerImp.currentPage(0);
              },
              onTapSpecial: () {
                addAppointControllerImp.currentPage(1);
              },
            ),
            ownerServicePages[addAppointControllerImp.currentIndex],
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
