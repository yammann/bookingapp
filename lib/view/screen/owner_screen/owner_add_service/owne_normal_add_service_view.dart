import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class   OwnerNormalAddServiceView extends StatelessWidget {
  OwnerNormalAddServiceView({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder<NormalTodoListControllerImp>(
      init: NormalTodoListControllerImp(),
      builder: (controller) {
        return Expanded(
          child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.todoItems.length,
                        itemBuilder: (context, index) {
                          return TodoItemCard(
                            todoItem: controller.todoItems[index],
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red[400],
                              size: 30,
                            ),
                            onTapIcon: () {
                              Get.defaultDialog(
                                title: "Confirme",
                                middleText:
                                    "Are you sure you need to delete this service",
                                backgroundColor: kOnBoardingBG,
                                onCancel: () {},
                                textCancel: "Cancel",
                                textConfirm: "Confirme",
                                onConfirm: () {
                                  controller.deleteItem(controller.todoItems[index].label);
                      
                                  Get.back();
                                },
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
                        title: "Add Service",
                        onTap: () {
                          Get.defaultDialog(
                            contentPadding: const EdgeInsets.all(20),
                            backgroundColor: kOnBoardingBG,
                              title: "Add Service",
                              middleText: "Write label for your service",
                              content: Column(
                                children: [
                                  AuthTextFiled(label: "Add Service", hint: "write your service",myController: controller.labelController,),
                                  SizedBox(height: 10,),
                                  AuthTextFiled(label: "Time", hint: "Add time for this service",myController: controller.timeController,keyboardType: TextInputType.number,),
                                ],
                              ),
                              onCancel: (){},
                              textCancel: "Cancel",
                              onConfirm: (){
                                controller.addItem(TodoItem(label: controller.labelController.text, time: int.parse(controller.timeController.text)));
                                Get.back();
                              },
                              textConfirm: "Add",
                              );
                        }),
                   
                  ],
                ),
        );
      },
    );
  }
}