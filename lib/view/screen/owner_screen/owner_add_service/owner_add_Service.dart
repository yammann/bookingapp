import 'package:e_store/controller/add_appoint/add_appoint_controller.dart';
import 'package:e_store/controller/add_appoint/normal_todo_list_controller.dart';
import 'package:e_store/controller/add_appoint/special_todo_list_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/view/screen/add_appoint/normal_service_view.dart';
import 'package:e_store/view/screen/add_appoint/special_service_view.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/double_button.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/todo_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerAddServiceView extends StatelessWidget {
  const OwnerAddServiceView({super.key});
 @override
  Widget build(BuildContext context) {
    Get.put(NormalTodoListControllerImp());
    Get.put(SpecialTodoListControllerImp());
    final AddAppointControllerImp addAppointControllerImp =
        Get.put(AddAppointControllerImp());
    return GetBuilder<AddAppointControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            DoubleButton(
              onTapNormal: () {
                addAppointControllerImp.currentPage(0);
              },
              onTapSpecial: () {
                addAppointControllerImp.currentPage(1);
              },
            ),
            
            ownerAddServicePages[addAppointControllerImp.currentIndex],
            
           
           
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
 
}
//  @override
//   Widget build(BuildContext context) {
//     Get.put(NormalTodoListControllerImp());
//     Get.put(SpecialTodoListControllerImp());
    
//     return GetBuilder<NormalTodoListControllerImp>(
//       builder: (controller) {
//         return Column(
//                 children: [
//                   SizedBox(height: 15,),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: controller.todoItems.length,
//                       itemBuilder: (context, index) {
//                         return TodoItemCard(
//                           label: controller.todoItems[index].label,
//                           icon: Icon(
//                             Icons.delete_forever,
//                             color: Colors.red[400],
//                             size: 30,
//                           ),
//                           onTapIcon: () {
//                             Get.defaultDialog(
//                               title: "Confirme",
//                               middleText:
//                                   "Are you sure you need to delete this service",
//                               backgroundColor: kOnBoardingBG,
//                               onCancel: () {},
//                               textCancel: "Cancel",
//                               textConfirm: "Confirme",
//                               onConfirm: () {
//                                 controller.deleteItem(controller.todoItems[index].label);
                    
//                                 Get.back();
//                               },
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   AppButton(
//                       title: "Add Service",
//                       onTap: () {
//                         Get.defaultDialog(
//                           contentPadding: EdgeInsets.all(20),
//                           backgroundColor: kOnBoardingBG,
//                             title: "Add Service",
//                             middleText: "Write label for your service",
//                             content: AuthTextFiled(label: "Add Service", hint: "write your service",myController: controller.labelController,),
//                             onCancel: (){},
//                             textCancel: "Cancel",
//                             onConfirm: (){
//                               controller.addItem(TodoItem(label: controller.labelController.text));
//                               Get.back();
//                             },
//                             textConfirm: "Add",
//                             );
//                       }),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               );
//       },
//     );
//   }