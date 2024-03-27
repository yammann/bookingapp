import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class MyAppointmentController extends GetxController {
  Stream<List<AppointmentModel>> get appointmentsStream;
  Future<void> cancelAppointment(String documentId, String appointmentId);
}

class MyAppointmentControllerImp extends MyAppointmentController {
  final User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Stream<List<AppointmentModel>> get appointmentsStream {
    CollectionReference appointCollection =
        FirebaseFirestore.instance.collection("apointment");

    return appointCollection.snapshots().asyncMap((snapshot) async {
      List<AppointmentModel> bookedAppointList = [];

      for (QueryDocumentSnapshot document in snapshot.docs) {
        QuerySnapshot subCollectionSnapshot = await document.reference
            .collection("time")
            .where("userId", isEqualTo: currentUser.uid)
            .get();

        for (QueryDocumentSnapshot doc in subCollectionSnapshot.docs) {
          AppointmentModel appointmentModel =
              AppointmentModel.fromJson(doc.data() as Map<String, dynamic>);

          if (!bookedAppointList.any((existingAppointment) =>
              existingAppointment.appointmentId ==
              appointmentModel.appointmentId)) {
            if (!appointmentModel.appointmentExceed) {
              bookedAppointList.add(appointmentModel);
            }
          }
        }
      }

      return bookedAppointList;
    });
  }

  @override
  Future<void> cancelAppointment(
      String documentId, String appointmentId) async {
    CollectionReference appointCollection = FirebaseFirestore.instance
        .collection("apointment")
        .doc(documentId)
        .collection("time");

    QuerySnapshot appointQuerySnapshot = await appointCollection
        .where("appointmentId", isEqualTo: appointmentId)
        .get();

    for (QueryDocumentSnapshot appointDocumentSnapshot
        in appointQuerySnapshot.docs) {
      DocumentReference appointDocumentReference =
          appointDocumentSnapshot.reference;
      appointDocumentReference.update({
        "userProfImg": null,
        "userName": null,
        "userId": null,
        "detail": null,
        "state": true,
        "duration": null,
        "appointmentId": null,
      });
    }
    Get.back();
    Get.snackbar("Alert".tr, "canceled".tr,backgroundColor: kSuccessSnackbar);
    
  }
}
