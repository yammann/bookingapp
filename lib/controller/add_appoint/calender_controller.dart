import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/appointment_exceed.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CalenderController extends GetxController {
  onSelectedDay(DateTime selectedDay);
  getApointment(String documentId);
  changeSelectedTime(int index);
  timeCalculation();
  onSelectTime(int index);
  appointmentExists();
  nextAppointmentIsAvailable(int index);
  addDateToAppointment(String date);
}

class CalenderControllerImp extends CalenderController {
  bool holiday = true;
  DateTime isSelectedDay = DateTime.now();
  List<AppointmentModel> upAppointmentlist = [];
  bool hasAppoint = false;
  int selectedTime = 0;
  List selectedTodoList = Get.arguments["selectedTodoList"];
  UserModel userModel=Get.arguments["userModel"];
  int time = 0;
  final User currentUser = FirebaseAuth.instance.currentUser!;

  List<AppointmentModel> willBookedAppointment = [];

  Future<void> getDataList(String documentId) async {
    List<AppointmentModel> listForImplement = [];

    CollectionReference timeCollection = FirebaseFirestore.instance
        .collection("apointment")
        .doc(documentId)
        .collection("time");
        
    QuerySnapshot timeQuerySnapshot = await timeCollection.get();
    for (var timeDocumentSnapshot in timeQuerySnapshot.docs) {
      AppointmentModel appointment = AppointmentModel.fromJson(
          timeDocumentSnapshot.data() as Map<String, dynamic>);
      listForImplement.add(appointment);
    }
    upAppointmentlist = listForImplement;
    print("11111111111111111111111111$upAppointmentlist");
    update();
  }

  @override
  Future<void> getApointment(String documentId) async {
    //documentId = Date
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("apointment").doc(documentId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      await getDataList(documentId);
    } else {
      Get.snackbar("Alert","You have to wait for a few seconds to load the appointments",backgroundColor: kOnBoardingP);
      
      for (AppointmentModel appointment in appointmentList) {
        Map<String, dynamic> data = appointment.toMap();
        await documentReference.set({"date": documentId});
        await documentReference.collection("time").doc(data["time"]).set(data);
      }
      await addDateToAppointment(documentId);
      await getDataList(documentId);
    }
  }

  @override
  changeSelectedTime(int index) {
    selectedTime = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    if (DateTime.now().weekday == DateTime.wednesday ||
        DateTime.now().weekday == DateTime.sunday) {
      timeCalculation();
      appointmentExists();
    } else {
      holiday = false;
      appointmentIfExceed(isSelectedDay.toString().substring(0, 10));
      await getApointment(isSelectedDay.toString().substring(0, 10));
      appointmentExists();
      timeCalculation();
    }
    print(Get.arguments["selectedTodoList"]);
    print(selectedTodoList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  onSelectedDay(DateTime selectedDay) {
    upAppointmentlist.clear();
    update();
    if (selectedDay.weekday == DateTime.wednesday ||
        selectedDay.weekday == DateTime.sunday) {
      holiday = true;
      isSelectedDay = selectedDay;
      update();
    } else {
      holiday = false;
      isSelectedDay = selectedDay;
      getApointment(selectedDay.toString().substring(0, 10));
      update();
    }
  }

  @override
  timeCalculation() {
    time = 0;
    for (TodoItem todoItem in selectedTodoList) {
      time += todoItem.time;
      update();
    }
    print(time);
  }

  @override
  onSelectTime(int index) {
    //check if has appointment

    changeSelectedTime(index);
    //check if appointment is available
    if (upAppointmentlist[index].state && !upAppointmentlist[index].isBlocked) {
      if (hasAppoint) {
        Get.snackbar("Warrning", "you are onready have a appointment ",
            backgroundColor: kWorrningSnackbar);
      } else {
        //check if appointment is need more than 30 m
        if (nextAppointmentIsAvailable(index)) {
          Get.offNamed(AppRoute.confirmePage, arguments: {
            "selectedTodoList": selectedTodoList,
            "appointment": willBookedAppointment,
            "userModel":userModel,
          });
        } else {
          Get.snackbar(
            "Warrning",
            "The services you have chosen require time $time minutes. Please choose a time that follows is empty so that we can book a 1-hour appointment for you.",
            backgroundColor: kWorrningSnackbar,
          );
        }
      }
    } else {
      if (!upAppointmentlist[index].state) {
        if (upAppointmentlist[index].isBlocked) {
          Get.snackbar(
            "Alert",
            "This appointment is blocked select another appointment",
            backgroundColor: kWorrningSnackbar,
          );
        } else {
          Get.snackbar(
              "Alert", "This appointment is booked select another appointment",
              backgroundColor: Colors.grey);
        }
      }
    }
  }

 

  
  @override
  appointmentExists() async {
    CollectionReference appointCollection =
        FirebaseFirestore.instance.collection("apointment");
    Stream<QuerySnapshot<Object?>> appointQuerySnapshot =
        appointCollection.snapshots();
    appointQuerySnapshot.listen(
      (QuerySnapshot snapshot) async {
        for (QueryDocumentSnapshot document in snapshot.docs) {
          Stream<QuerySnapshot<Object?>> subCollectionSnapshot = document
              .reference
              .collection("time")
              .where("userId", isEqualTo: currentUser.uid)
              .snapshots();
          subCollectionSnapshot.listen(
            (QuerySnapshot snapshot) {
              for (QueryDocumentSnapshot document in snapshot.docs) {
                AppointmentModel appointmentModel = AppointmentModel.fromJson(
                    document.data() as Map<String, dynamic>);

                hasAppoint = !appointmentModel.appointmentExceed &&
                    !appointmentModel.isBlocked &&
                    appointmentModel.userId != ownerUserId;
              }
              update();
            },
          );
        }
      },
    );
  }

  @override
  nextAppointmentIsAvailable(int index) {
    double countAppointment = time / 30;
    bool available = false;
    print("77777777777777777777777777777777777777$countAppointment");
    for (int i = 0; i < countAppointment; i++) {
      if (index + i <= 19) {
        if (upAppointmentlist[index + i].state &&
            !upAppointmentlist[index + i].isBlocked) {
          willBookedAppointment.add(upAppointmentlist[index + i]);
          update();
          available = true;
        } else {
          willBookedAppointment.clear();
          update();
          available = false;
          break;
        }
      } else {
        willBookedAppointment.clear();
          update();
        available = false;
      }
    }
    return available;
  }
  
  @override
  addDateToAppointment(String date) async{
   CollectionReference timeCollection = FirebaseFirestore.instance
        .collection("apointment")
        .doc(date)
        .collection("time");
    QuerySnapshot timeQuerySnapshot = await timeCollection.get();
    for (var timeDocumentSnapshot in timeQuerySnapshot.docs) {
     timeDocumentSnapshot.reference.update({"date":date});
    }
  }
}
 