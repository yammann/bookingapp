import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/function/check_if_snackbar_is_active.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class BlockingCalenderController extends GetxController {
  onSelectedDay(DateTime selectedDay);
  blockingDay();
  updateAppointState(DocumentReference documentReference);
  isDayHaveAppointment(DocumentReference documentReference);
  addAppointToDB(DocumentReference documentReference, String date);
}

class BlockingCalenderControllerImp extends BlockingCalenderController {
  DateTime isSelectedDay = DateTime.now();
  bool isLoading = false;
  User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  onSelectedDay(DateTime selectedDay) {
    isSelectedDay = selectedDay;
    update();
  }

  @override
  blockingDay() async {
    Get.back();

    isLoading = true;
    update();

    String date = isSelectedDay.toString().substring(0, 10);

    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("barber")
          .doc(currentUser.uid)
          .collection("apointment")
          .doc(date);

      DocumentSnapshot documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        if (await isDayHaveAppointment(documentReference)) {
          isActiveSnackbar();
          Get.snackbar("Alert".tr, "blockinError".tr,
              backgroundColor: kWorrningSnackbar);
        } else {
          await updateAppointState(documentReference);
          isActiveSnackbar();
          Get.snackbar("Alert".tr, "blockingSuccess".tr,
              backgroundColor: kSuccessSnackbar);
        }
      } else {
        await addAppointToDB(documentReference, date);

        await updateAppointState(documentReference);
        isActiveSnackbar();
        Get.snackbar("Alert".tr, "blockingSuccess".tr,
            backgroundColor: kSuccessSnackbar);
      }

      isLoading = false;
      update();
    } catch (e) {
      isActiveSnackbar();
      Get.snackbar("Warning".tr, "error".tr,
          backgroundColor: kWorrningSnackbar);
    }
  }

  @override
  updateAppointState(DocumentReference documentReference) async {
    try {
      QuerySnapshot appointQuerySnapshot =
          await documentReference.collection("time").get();

      for (QueryDocumentSnapshot appointmentDocument
          in appointQuerySnapshot.docs) {
        appointmentDocument.reference.update({"isBlocked": true});
      }
    } catch (e) {
      isActiveSnackbar();
      Get.snackbar("Warning".tr, "error".tr, backgroundColor: kSuccessSnackbar);
    }
  }

  @override
  isDayHaveAppointment(DocumentReference documentReference) async {
    try {
      QuerySnapshot bookedAppointQuerySnapshot = await documentReference
          .collection("time")
          .where("state", isEqualTo: false)
          .get();

      List<AppointmentModel> uniqueAppointments = [];

      for (QueryDocumentSnapshot document in bookedAppointQuerySnapshot.docs) {
        AppointmentModel appointmentModel =
            AppointmentModel.fromJson(document.data() as Map<String, dynamic>);
        uniqueAppointments.add(appointmentModel);
      }

      if (uniqueAppointments.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      isActiveSnackbar();
      Get.snackbar("Warning".tr, "error".tr, backgroundColor: kSuccessSnackbar);
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
}
