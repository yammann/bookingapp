import 'package:e_store/controller/add_appoint/todo_list_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAppointView extends StatelessWidget {
  const AddAppointView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(TodoListControllerImp());
    return Column(
      children: [
        const Text(
          "Select what you will do",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GetBuilder<TodoListControllerImp>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.todoItems.length,
                itemBuilder: (context, index) {
                  return TodoItemCard(
                    onTap: () {
                      controller.toggleCheckbox(index);
                      controller
                          .selectedTodo(controller.todoItems[index].label);
                    },
                    label: controller.todoItems[index].label,
                    isSelected: controller.todoItems[index].isSelected,
                    onChanged: (value) {
                      controller.toggleCheckbox(index);
                      controller
                          .selectedTodo(controller.todoItems[index].label);
                    },
                  );
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AppButton(
            title: "Next",
            onTap: () {
              Get.toNamed(AppRoute.cleander);
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
