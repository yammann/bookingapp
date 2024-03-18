import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CalenderController extends GetxController {
  onSelectedDay(DateTime selectedDay, DateTime focusedDay);
  getApointment(String documentId);
  changeSelectedTime(int index);
  timeCalculation();
  onSelectTime(int index);
  onAppointmentExceed(String documentId);
  appointmentExists();
}

class CalenderControllerImp extends CalenderController {
  bool holiday = true;
  DateTime isSelectedDay = DateTime.now();
  List<AppointmentModel> upAppointmentlist = [];
  bool hasAppoint = false;
  int selectedTime = 0;
  late List selectedTodoList;
  int time = 0;
  final User currentUser = FirebaseAuth.instance.currentUser!;

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
    print(upAppointmentlist);
    update();
  }

  @override
  Future<void> getApointment(String documentId) async {
    //documentId = Date
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("apointment").doc(documentId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      getDataList(documentId);
    } else {
      Get.snackbar("Alert",
          "You have to wait for a few seconds to load the appointments",
          backgroundColor: kOnBoardingP);
      for (AppointmentModel appointment in appointmentList) {
        appointment.date = documentId;
        var data = appointment.toMap();
        await documentReference.set({"date": documentId});
        await documentReference.collection("time").doc(data["time"]).set(data);
      }
      getDataList(documentId);
    }
  }

  @override
  changeSelectedTime(int index) {
    selectedTime = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    if (DateTime.now().weekday == DateTime.wednesday ||
        DateTime.now().weekday == DateTime.sunday) {
      appointmentExists();
    } else {
      holiday = false;
      getApointment(isSelectedDay.toString().substring(0, 10));
      onAppointmentExceed(isSelectedDay.toString().substring(0, 10));
      appointmentExists();
    }
    selectedTodoList = Get.arguments["selectedTodoList"];
    print(Get.arguments["selectedTodoList"]);
    print(selectedTodoList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  onSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    upAppointmentlist.clear();
    update();
    if (selectedDay.weekday == DateTime.wednesday ||
        selectedDay.weekday == DateTime.sunday) {
      holiday = true;
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
    timeCalculation();
    changeSelectedTime(index);
    //check if appointment is available
    if (upAppointmentlist[index].state && !upAppointmentlist[index].isBlocked) {
      if (hasAppoint) {
        Get.snackbar("Warrning", "you are onready have a appointment ",
            backgroundColor: kWorrningSnackbar);
      } else {
        //check if appointment is need more than 30 m
        if (time > 30) {
          //check if the last appointment
          if (upAppointmentlist.length == index + 1) {
            Get.offNamed(AppRoute.confirmePage, arguments: {
              "selectedTodoList": selectedTodoList,
              "appointment": [upAppointmentlist[index]]
            });
            //check if next appointment is available
          } else {
            if (upAppointmentlist[index + 1].state &&
                !upAppointmentlist[index + 1].isBlocked) {
              Get.offNamed(AppRoute.confirmePage, arguments: {
                "selectedTodoList": selectedTodoList,
                "appointment": [
                  upAppointmentlist[index],
                  upAppointmentlist[index + 1]
                ]
              });
            } else {
              Get.snackbar(
                "Warrning",
                "The services you have chosen require time more than 30 minutes. Please choose a time that follows is empty so that we can book a 1-hour appointment for you.",
                backgroundColor: kWorrningSnackbar,
              );
            }
          }
        } else {
          Get.offNamed(AppRoute.confirmePage, arguments: {
            "selectedTodoList": selectedTodoList,
            "appointment": [upAppointmentlist[index]]
          });
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
  onAppointmentExceed(String documentId) async {
    DateTime currentTime = DateTime.now();

    CollectionReference appointCollection =
        FirebaseFirestore.instance.collection("apointment");

    Stream<QuerySnapshot<Object?>> appointQuerySnapshot =
        appointCollection.snapshots();

    appointQuerySnapshot.listen(
      (QuerySnapshot snapshot) {
        for (QueryDocumentSnapshot document in snapshot.docs) {
          Stream<QuerySnapshot<Object?>> subCollectionSnapshot = document
              .reference
              .collection("time")
              .where("appointmentExceed", isEqualTo: false)
              .snapshots();

          subCollectionSnapshot.listen(
            (QuerySnapshot snapshot) {
              List<AppointmentModel> uniqueAppointments = [];

              for (QueryDocumentSnapshot document in snapshot.docs) {
                AppointmentModel appointmentModel = AppointmentModel.fromJson(
                    document.data() as Map<String, dynamic>);
                uniqueAppointments.add(appointmentModel);
              }

              for (AppointmentModel appointment in uniqueAppointments) {
                String dateString =
                    '${appointment.date} ${appointment.time.substring(0, 5)}:00';
                print(dateString);
                DateTime dateTime = DateTime.parse(dateString);
                print(dateTime);
                if (!appointment.appointmentExceed &&
                    currentTime.isAfter(dateTime)) {
                  FirebaseFirestore.instance
                      .collection("apointment")
                      .doc(appointment.date)
                      .collection("time")
                      .doc(appointment.time)
                      .update({
                    "appointmentExceed": true,
                  });
                }
              }
            },
          );
        }
      },
    );
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
}
