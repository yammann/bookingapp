import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:get/get.dart';

abstract class CalenderController extends GetxController {
  onSelectedDay(DateTime selectedDay, DateTime focusedDay);
  getApointment(String documentId);
  changeSelectedTime(int index);
}

class CalenderControllerImp extends CalenderController {
  bool holiday = true;
  DateTime isSelectedDay = DateTime.now();
  List<ApointmentModel> datalist = [];
  int selectedTime = 0;

  Future<void> getDataList(String documentId) async {
    List<ApointmentModel> listForImplement = [];

    CollectionReference timeCollection = FirebaseFirestore.instance
        .collection("apointment")
        .doc(documentId)
        .collection("time");
    QuerySnapshot timeQuerySnapshot = await timeCollection.get();
    for (var timeDocumentSnapshot in timeQuerySnapshot.docs) {
      ApointmentModel appointment = ApointmentModel.fromJson(
          timeDocumentSnapshot.data() as Map<String, dynamic>);
      listForImplement.add(appointment);
    }
    datalist = listForImplement;
    print(datalist);
    update();
  }

  @override
  Future<void> getApointment(String documentId) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("apointment").doc(documentId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      getDataList(documentId);
    } else {
      for (ApointmentModel appointment in apointmentList) {
        var data = appointment.toMap();
        await documentReference.set({"data": documentId});
        await documentReference.collection("time").doc(data["time"]).set(data);
        getDataList(documentId);
      }
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
    } else {
      getApointment(isSelectedDay.toString().substring(0, 10));
    }
  }

  @override
  onSelectedDay(DateTime selectedDay, DateTime focusedDay) {
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
}
