import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:get/get.dart';

abstract class CalenderController extends GetxController {
  selectDay(DateTime day);
  getApointment(String documentId);
  changeSelectedTime(int index);
}


class CalenderControllerImp extends CalenderController {
  DateTime isSelectedDay = DateTime.now();
  List<ApointmentModel> datalist = [];
  int selectedTime=0;
  Future<void> getDataList(String documentId) async {
      List<ApointmentModel> listForImplement = [];

    CollectionReference timeCollection = FirebaseFirestore.instance
        .collection("apointment")
        .doc(documentId)
        .collection("time");

    // Get the documents in the "time" collection
    QuerySnapshot timeQuerySnapshot = await timeCollection.get();

    // Iterate through the documents and add data to datalist
    for (var timeDocumentSnapshot in timeQuerySnapshot.docs) {
      // Convert data to ApointmentModel using a factory constructor or a method in your model
      ApointmentModel appointment = ApointmentModel.fromJson(
          timeDocumentSnapshot.data() as Map<String, dynamic>);

      // Add the appointment data to datalist
      listForImplement.add(appointment); // If you want to store JSON data, adjust as needed
    }
    datalist=listForImplement;
    print(datalist);
    update();
    // Print or use the data in datalist as needed
  }

  @override
  selectDay(day) {
    isSelectedDay = day;
    update();
  }

  @override
  Future<void> getApointment(String documentId) async {
    print("--------------------------------------------------------------------------$documentId");
    // Reference to the document
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("apointment").doc(documentId);

    // Get the document snapshot
    DocumentSnapshot documentSnapshot = await documentReference.get();

    // Check if the document exists and if it has any data
    if (documentSnapshot.exists) {
      getDataList(documentId);
      // You can access the data using documentSnapshot.data()
    } else {
      for (ApointmentModel appointment in apointmentList) {
        var data = appointment.toJson();
        await documentReference.set({"data": documentId});
        await documentReference.collection("time").doc(data["time"]).set(data);
        getDataList(documentId); 
      }
    }
  }
  
  @override
  changeSelectedTime(int index) {
    selectedTime=index;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getApointment(isSelectedDay.toString().substring(0,10));
  }
}
