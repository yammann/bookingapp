import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class MyAppointmentController extends GetxController {
  fetchMyAppointment();
  Future<void> cancelAppointment(AppointmentModel appointmentModel);
}

class MyAppointmentControllerImp extends MyAppointmentController {
  final User currentUser = FirebaseAuth.instance.currentUser!;
  late UserModel userModel;
  List<AppointmentModel> bookedAppointList = [];

  @override
  void onInit() async {
    userModel = await getUserData(currentUser.uid);
    await fetchMyAppointment();
    super.onInit();
  }

  @override
  fetchMyAppointment() async {
    QuerySnapshot barberSnapshot =
        await FirebaseFirestore.instance.collection("barber").get();

    for (DocumentSnapshot barberDoc in barberSnapshot.docs) {
      CollectionReference appointCollection = FirebaseFirestore.instance
          .collection("barber")
          .doc(barberDoc.id)
          .collection("apointment");

      QuerySnapshot appointSnapshot = await appointCollection.get();

      for (QueryDocumentSnapshot document in appointSnapshot.docs) {
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
    }
    update();
  }

  @override
  Future<void> cancelAppointment(AppointmentModel appointmentModel) async {
    CollectionReference appointCollection = FirebaseFirestore.instance
        .collection("barber")
        .doc(appointmentModel.barberId)
        .collection("apointment")
        .doc(appointmentModel.date)
        .collection("time");

    QuerySnapshot appointQuerySnapshot = await appointCollection
        .where("appointmentId", isEqualTo: appointmentModel.appointmentId)
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
        "barberId": null,
        "barberName": null,
      });
    }
    Get.back();
    Get.snackbar("Alert".tr, "canceled".tr, backgroundColor: kSuccessSnackbar);
    Get.offAllNamed(AppRoute.onBoarding);
  }
}
