import 'package:e_store/controller/add_appoint/add_appoint_controller.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/view/widget/double_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerAddAppointView extends StatelessWidget {
   OwnerAddAppointView({super.key});
   
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAppointControllerImp>(
      init: AddAppointControllerImp(),
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
            ownerServicePages[controller.currentIndex],
            const SizedBox(
              height: 30,
            ),
          ],
        );
      },
    );
  }
}
