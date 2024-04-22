import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerNormalAddServiceView extends StatelessWidget {
  OwnerNormalAddServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NormalTodoListControllerImp>(
      init: NormalTodoListControllerImp(),
      builder: (controller) {
        return Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
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
                          title: "Confirme".tr,
                          middleText:
                              "Are you sure you need to delete this service".tr,
                          backgroundColor: kOnBoardingBG,
                          onCancel: () {},
                          textCancel: "Cancel".tr,
                          textConfirm: "Confirme".tr,
                          onConfirm: () {
                            controller
                                .deleteItem(controller.todoItems[index].label);

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
                  title: "Add Service".tr,
                  onTap: () {
                    Get.defaultDialog(
                      contentPadding: const EdgeInsets.all(20),
                      backgroundColor: kOnBoardingBG,
                      title: "Add Service".tr,
                      middleText: "Write label for your service".tr,
                      content: Column(
                        children: [
                          AuthTextFiled(
                            label: "Add Service".tr,
                            hint: "write your service".tr,
                            myController: controller.labelController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AuthTextFiled(
                            label: "Time".tr,
                            hint: "Add time for this service".tr,
                            myController: controller.timeController,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "note".tr,
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      onCancel: () {},
                      textCancel: "Cancel".tr,
                      onConfirm: () {
                        if (controller.timeController.text.isNotEmpty &&
                            controller.labelController.text.isNotEmpty) {
                          controller.addItem(TodoItem(
                              label: controller.labelController.text,
                              time: int.parse(controller.timeController.text)));
                          Get.back();
                        }
                      },
                      textConfirm: "Add".tr,
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
