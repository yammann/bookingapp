import 'package:e_store/controller/add_appoint/add_appoint_controller.dart';
import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/view/widget/double_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAppointView extends StatelessWidget {
   AddAppointView({super.key});
    final  AddAppointControllerImp addAppointControllerImp= Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAppointControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            DoubleButton(
              onTapNormal: () {
                controller.currentPage(0);
              },
              onTapSpecial: () {
                controller.currentPage(1);
              },
            ),
            userServicePages[controller.currentIndex],
            const SizedBox(
              height: 30,
            ),
          ],
        );
      },
    );
  }
}
