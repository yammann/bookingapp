import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/screen/owner_screen/widget/dropdownList.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerSpecialServiceView extends StatelessWidget {
  const OwnerSpecialServiceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
           Text(
            "Special services".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<SpecialTodoListControllerImp>(
              init: SpecialTodoListControllerImp(),
              builder: (controller) {
                return Container(
                  margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
                  child: Column(
                    children: [
                      DropdownList(
                        items:controller.users,
                        title: controller.title.tr,
                        onChanged: (userModel) {
                          controller.onSelectOfDropdownList(userModel!);
                        },),
                     
                      const Spacer(flex: 1,),
                      AuthTextFiled(
                        myController: controller.detailController,
                        keyboardType: TextInputType.text,
                        label: "Detail".tr,
                        hint: "Enter service details".tr,
                        icon: const Icon(
                          Icons.description_outlined,
                        ),
                      ),
                      const Spacer(flex: 1,),
                      AuthTextFiled(
                        myController: controller.durationController,
                        keyboardType: TextInputType.number,
                        label: "Duration".tr,
                        hint:
                            "Enter how long the service takes in minutes".tr,
                        icon: const Icon(
                          Icons.hourglass_top_rounded,
                        ),
                      ),
                     const Spacer(flex: 5,),
                      AppButton(
                        title: "Next".tr,
                        onTap: () {
                          controller.navToCalender();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        color: kWorrningSnackbar,
                        title: "Blocked for a whole day".tr,
                        onTap: () {
                          Get.toNamed(AppRoute.blockingCalender);
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
    
        ],
      ),
    );
  }
}
// ListView.builder(
//                   itemCount: controller.todoItems.length,
//                   itemBuilder: (context, index) {
//                     return TodoItemCard(
//                       onTap: () {Get.toNamed(AppRoute.calendarPage);},
//                       todoItem: controller.todoItems[index],
//                       icon: Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                     );
//                   },
//                 );