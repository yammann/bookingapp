import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/class/local_noification.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/check_if_snackbar_is_active.dart';
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
  List<AppointmentModel> appointment = Get.arguments["appointment"];
  List<TodoItem> selectedTodoItem = Get.arguments["selectedTodoList"];
  UserModel userModel=Get.arguments["userModel"];
  UserModel? barber=Get.arguments["barber"];
  UserModel? customer=Get.arguments["customer"];

  User currentUser = FirebaseAuth.instance.currentUser!;
  String detail = "";
  int duration = 0;
  
  @override
  void onInit() async {
    detailText();
    super.onInit();
  }

  @override
  detailText() {
    for (TodoItem todoItem in selectedTodoItem) {
      String label = todoItem.label;
      int time = todoItem.time!;
      detail = "$detail-$label";
      duration += time;
    }
    update();
  }

  @override
  confirme() async {
    try {
      String appointmentId=uuid.v1();
      for (AppointmentModel appointmentModel in appointment) {
        await FirebaseFirestore.instance
            .collection("barber")
            .doc(barber?.userId??userModel.userId)
            .collection("apointment")
            .doc(appointmentModel.date.toString())
            .collection("time")
            .doc(appointmentModel.time)
            .update({
          "detail": detail,
          "state": false,
          "userId": customer?.userId??userModel.userId,
          "userName": customer?.userName??userModel.userName,
          "userProfImg": customer?.imgProfile??userModel.imgProfile,
          "duration":duration,
          "appointmentId":appointmentId,
          "barberId":barber?.userId??userModel.userId,
          "barberName":barber?.userName??userModel.userName,
        });
      }
      isActiveSnackbar();
      Get.snackbar(
        "Success".tr,"AppointConfermied".tr,backgroundColor: kSuccessSnackbar,
        icon: Icon(Icons.check_circle_rounded,size: 30,color: Colors.green[900],
        ),
      );
      
        Get.offAllNamed(AppRoute.onBoarding);
      
      int year=int.parse(appointment[0].date!.substring(0,4));
      int month=int.parse(appointment[0].date!.substring(5,7));
      int day=int.parse(appointment[0].date!.substring(8,10))-1;
      String now=DateTime.now().toString().substring(0,10);

      if(appointment[0].date!=now){
         LocalNotification.cancel(2);
         LocalNotification.scheduleNotification(year,month,day,
      "notifRimening1".tr + "notifRimening2".tr + appointment[0].time.substring(0,5));
      }
     LocalNotification.cancel(1);
      LocalNotification.repeatNotification(
       "notifRimening1".tr + "notifRimening3".tr);

    } catch (e) {
      isActiveSnackbar();
      Get.snackbar(
        "Warning".tr,
        "error".tr,
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
