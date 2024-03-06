import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalServiceView extends StatelessWidget {
   NormalServiceView({super.key});
  final NormalTodoListControllerImp normalTodoListControllerImp=Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
           const Text(
            "Normal services list",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<NormalTodoListControllerImp>(
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
                      icon: Icon(
                        controller.todoItems[index].isSelected
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        color: controller.todoItems[index].isSelected
                            ? Colors.green[400]
                            : Colors.red[400],
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
           AppButton(
                title: "Next",
                onTap: () {
                  Get.toNamed(AppRoute.cleander);
                }),
        ],
      ),
    );
  }
}