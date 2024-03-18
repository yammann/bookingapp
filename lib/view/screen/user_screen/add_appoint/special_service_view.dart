import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialServiceView extends StatelessWidget {
   SpecialServiceView({super.key});
    final SpecialTodoListControllerImp specialTodoListControllerImp=Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
           const Text(
            "Special services list",
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
                      onTap: () {
                        Get.defaultDialog(
                          backgroundColor: kOnBoardingBG,
                          contentPadding: EdgeInsets.all(20),
                          title: "Special Appointment",
                          middleText: "To book a ${controller.todoItems[index].label} call my Phone number:222222222",
                          middleTextStyle: TextStyle(fontSize: 16),
                           onCancel: (){},
                              textCancel: "Cancel",
                              onConfirm: (){
                                controller.call("+905340763078");
                                Get.back();
                              },
                              textConfirm: "call My",
                              
                        );
                      },
                      todoItem: controller.todoItems[index],
                      icon: Icon(Icons.star,color: Colors.amber,),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}