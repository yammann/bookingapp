import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/appointment_exceed.dart';
import 'package:e_store/core/function/check_if_snackbar_is_active.dart';
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
  addAppointToDB(DocumentReference documentReference, String date);
  isHoliday(DateTime isDay);
}

class CalenderControllerImp extends CalenderController {
  bool holiday = false;
  DateTime isSelectedDay = DateTime.now();
  List<AppointmentModel> upAppointmentlist = [];
  bool hasAppoint = false;
  int selectedTime = 0;
  List selectedTodoList = Get.arguments["selectedTodoList"];
  UserModel userModel = Get.arguments["userModel"];
  UserModel? barber = Get.arguments["barber"];
  UserModel? customer = Get.arguments["customer"];
  int time = 0;
  final User currentUser = FirebaseAuth.instance.currentUser!;
  List<AppointmentModel> willBookedAppointment = [];

  @override
  void onInit() async {
    super.onInit();
    isHoliday(isSelectedDay);
    if (holiday) {
      timeCalculation();
      await appointmentExists();
    } else {
      holiday = false;
      appointmentIfExceed(isSelectedDay.toString().substring(0, 10), barber?.userId??userModel.userId);
      await getApointment(isSelectedDay.toString().substring(0, 10));
      await appointmentExists();
      timeCalculation();
    }
    
  }

  Future<void> getDataList(String documentId) async {
    List<AppointmentModel> listForImplement = [];

    CollectionReference timeCollection = FirebaseFirestore.instance
        .collection("barber")
        .doc(barber?.userId ?? userModel.userId)
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
    update();
  }

  @override
  Future<void> getApointment(String documentId) async {
    //documentId = Date
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("barber")
        .doc(barber?.userId ?? userModel.userId)
        .collection("apointment")
        .doc(documentId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      await getDataList(documentId);
    } else {
      isActiveSnackbar();
      Get.snackbar("Alert".tr, "waiting".tr, backgroundColor: kOnBoardingP);
      await addAppointToDB(documentReference, documentId);
      await addDateToAppointment(documentId);
      await getDataList(documentId);
    }
  }

  @override
  addAppointToDB(DocumentReference documentReference, String date) async {
    try {
      for (AppointmentModel appointment in appointmentList) {
        var data = appointment.toMap();
        await documentReference.set({"date": date});
        await documentReference.collection("time").doc(data["time"]).set(data);
      }
    } catch (e) {
      isActiveSnackbar();
      Get.snackbar("Warning".tr, "error".tr, backgroundColor: kSuccessSnackbar);
    }
  }

  @override
  changeSelectedTime(int index) {
    selectedTime = index;
    update();
  }

  @override
  onSelectedDay(DateTime selectedDay) {
    upAppointmentlist.clear();
    update();
    isHoliday(selectedDay);
    if (holiday) {
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
      time += todoItem.time!;
      update();
    }
  }

  @override
  onSelectTime(int index) {
    changeSelectedTime(index);
    //check if appointment is available
    if (upAppointmentlist[index].state 
    && !upAppointmentlist[index].isBlocked 
    && !upAppointmentlist[index].appointmentExceed) {
      if (hasAppoint) {
        isActiveSnackbar();
        Get.snackbar("Warning".tr, "haveAppoint".tr,
            backgroundColor: kWorrningSnackbar);
      } else {
        if (nextAppointmentIsAvailable(index)) {
          Get.offNamed(AppRoute.confirmePage, arguments: {
            "selectedTodoList": selectedTodoList,
            "appointment": willBookedAppointment,
            "userModel": userModel,
            "barber": barber,
            "customer":customer,
          });
        } else {
          isActiveSnackbar();
          Get.snackbar(
            "Warning".tr,
            "requiredTime1".tr + time.toString() + "requiredTime2".tr,
            backgroundColor: kWorrningSnackbar,
          );
        }
      }
    } else {
      if (!upAppointmentlist[index].state) {
        if (upAppointmentlist[index].isBlocked) {
          isActiveSnackbar();
          Get.snackbar(
            "Alert".tr,
            "appointBlocked".tr,
            backgroundColor: kWorrningSnackbar,
          );
        } else {
          isActiveSnackbar();
          Get.snackbar("Alert".tr, "appointBooked".tr,
              backgroundColor: Colors.grey);
        }
      }
    }
  }

 

  @override
  appointmentExists() async {
    CollectionReference barberCollection =FirebaseFirestore.instance.collection("barber");

    Stream<QuerySnapshot<Object?>> barberQuerySnapshot =barberCollection.snapshots();

    barberQuerySnapshot.listen((QuerySnapshot snapshot) async {

        for (QueryDocumentSnapshot document in snapshot.docs) {
          CollectionReference appointCollection = document.reference.collection("apointment");

          Stream<QuerySnapshot<Object?>> appointQuerySnapshot = appointCollection.snapshots();
          appointQuerySnapshot.listen((QuerySnapshot snapshot) async {

              for (QueryDocumentSnapshot document in snapshot.docs) {
                Stream<QuerySnapshot<Object?>> timeCollectionSnapshot = document
                    .reference
                    .collection("time")
                    .where("userId", isEqualTo: currentUser.uid)
                    .snapshots();

                timeCollectionSnapshot.listen((QuerySnapshot snapshot) {

                    for (QueryDocumentSnapshot document in snapshot.docs) {
                      AppointmentModel appointmentModel =AppointmentModel.fromJson(document.data() as Map<String, dynamic>);

                      if(userModel.role==Role.customer){
                        if(!appointmentModel.appointmentExceed &&
                          !appointmentModel.isBlocked){
                            hasAppoint = true;
                          }
                      }
                    }
                    update();
                  },
                );
              }
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
    //fur update upAppointment list
    getDataList(isSelectedDay.toString().substring(0, 10));
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
  addDateToAppointment(String date) async {
    CollectionReference timeCollection = FirebaseFirestore.instance
        .collection("barber")
        .doc(barber?.userId ?? userModel.userId)
        .collection("apointment")
        .doc(date)
        .collection("time");
    QuerySnapshot timeQuerySnapshot = await timeCollection.get();
    for (var timeDocumentSnapshot in timeQuerySnapshot.docs) {
      timeDocumentSnapshot.reference.update({"date": date});
    }
  }
  
  @override
  isHoliday(DateTime isDay) {
     for(int day in userModel.holidays!){
      if(isDay.weekday==day){
        holiday=true;
        update();
        break;
      }else{
        holiday=false;
        update();
      }
    }
  }
}
