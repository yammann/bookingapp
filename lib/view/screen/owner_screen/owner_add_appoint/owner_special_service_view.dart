import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerSpecialServiceView extends StatelessWidget {
  OwnerSpecialServiceView({super.key});
  final SpecialTodoListControllerImp specialTodoListControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            "Special services",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<SpecialTodoListControllerImp>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.todoItems.length,
                  itemBuilder: (context, index) {
                    return TodoItemCard(
                      onTap: () {Get.toNamed(AppRoute.ownerCalendarPage);},
                      label: controller.todoItems[index].label,
                      icon: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
