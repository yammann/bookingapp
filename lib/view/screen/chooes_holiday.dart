import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/holiday_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HolidayView extends StatelessWidget {
  HolidayView({super.key});
  final HolidayControllerImp holidayControllerImp=Get.put(HolidayControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title: Text("Change Holiday".tr),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: Get.width > 600 ? 600 : double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text("Chooes yor holiday dayis".tr),
              const SizedBox(height: 10),
              Expanded(
                child: GetBuilder<HolidayControllerImp>(
                  init: HolidayControllerImp(),
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.holidays.length,
                      itemBuilder: (context, index) {
                        return TodoItemCard(
                          onTap: () {
                            controller.toggleCheckbox(index);
                            controller
                                .selectedTodo(index);
                          },
                          todoItem: controller.holidays[index],
                          padding:  const EdgeInsets.all(10),
                          icon: Icon(
                            controller.holidays[index].isSelected
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: controller.holidays[index].isSelected
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
              GetBuilder<HolidayControllerImp>(
                init: HolidayControllerImp(),
                builder: (controller) {
                  return AppButton(
                      title: "Confirme".tr,
                      onTap: () {
                        controller.confirme();
                      });
                },
              ),
               const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
