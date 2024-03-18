import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerSpecialServiceView extends StatelessWidget {
  OwnerSpecialServiceView({super.key});
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
              init: SpecialTodoListControllerImp(),
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.todoItems.length,
                  itemBuilder: (context, index) {
                    return TodoItemCard(
                      onTap: () {Get.toNamed(AppRoute.calendarPage);},
                      todoItem: controller.todoItems[index],
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
