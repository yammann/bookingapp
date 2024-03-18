import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ConfirmeController extends GetxController {
  detailText();
  confirme();
}

class ConfirmeControllerImp extends ConfirmeController {
  late List<AppointmentModel> appointment;
  late List<TodoItem> selectedTodoItem;
  User currentUser = FirebaseAuth.instance.currentUser!;
  String detail = "";
  int duration = 0;
  late UserModel userModel;
  
  @override
  void onInit() async {
    appointment = Get.arguments["appointment"];
    selectedTodoItem = Get.arguments["selectedTodoList"];
    detailText();
    userModel = await getUserData();
    super.onInit();
  }

  @override
  detailText() {
    for (TodoItem todoItem in selectedTodoItem) {
      String label = todoItem.label;
      int time = todoItem.time;
      detail = "$detail-$label";
      duration += time;
    }
    print(detail);
    update();
  }

  @override
  confirme() async {
    try {
      String appointmentId=uuid.v1();
      for (AppointmentModel appointmentModel in appointment) {
        await FirebaseFirestore.instance
            .collection("apointment")
            .doc(appointmentModel.date.toString())
            .collection("time")
            .doc(appointmentModel.time)
            .update({
          "detail": detail,
          "state": false,
          "userId": userModel.userId,
          "userName": userModel.userName,
          "userProfImg": userModel.imgProfile,
          "duration":duration,
          "appointmentId":appointmentId,
        });
      }
      Get.snackbar(
        "Success",
        "Appointment Confermied ",
        backgroundColor: kSuccessSnackbar,
        icon: Icon(
          Icons.check_circle_rounded,
          size: 30,
          color: Colors.green[900],
        ),
      );
      if(currentUser.uid==ownerUserId){
        Get.offNamed(AppRoute.ownerHome);
      }
      else{
        Get.offNamed(AppRoute.home);
      }
    } catch (e) {
      Get.snackbar(
        "Warrning",
        "Has error try again ",
        backgroundColor: kWorrningSnackbar,
        icon: Icon(
          Icons.cancel_presentation_rounded,
          size: 30,
          color: Colors.red[900],
        ),
      );
    }
  }
 
}
