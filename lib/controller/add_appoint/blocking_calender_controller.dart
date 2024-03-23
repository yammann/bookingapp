import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:get/get.dart';

abstract class BlockingCalenderController extends GetxController {
  onSelectedDay(DateTime selectedDay);
  blockingDay();
}

class BlockingCalenderControllerImp extends BlockingCalenderController {
  DateTime isSelectedDay = DateTime.now();
  bool isLoading = false;

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
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("apointment").doc(date);

      DocumentSnapshot documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        QuerySnapshot bookedAppointQuerySnapshot = await documentReference
            .collection("time")
            .where("state", isEqualTo: false)
            .get();

        List<AppointmentModel> uniqueAppointments = [];

        for (QueryDocumentSnapshot document in bookedAppointQuerySnapshot.docs) {
          AppointmentModel appointmentModel = AppointmentModel.fromJson(
              document.data() as Map<String, dynamic>);
              uniqueAppointments.add(appointmentModel);
        }

        if (uniqueAppointments.isNotEmpty) {
          // Get.back();
          Get.snackbar("Alert",
              "you are have appointments in this day you need cancel this appointment before blocking",backgroundColor: kWorrningSnackbar);
        } else {
           QuerySnapshot appointQuerySnapshot = await documentReference
            .collection("time")
            .get();
          for (QueryDocumentSnapshot appointmentDocument in appointQuerySnapshot.docs) {
            appointmentDocument.reference.update({"isBlocked": true});
          }
           Get.snackbar("Alert", "Blocking success",backgroundColor: kSuccessSnackbar);
        }
      } else {
        for (AppointmentModel appointment in appointmentList) {
          var data = appointment.toMap();
          await documentReference.set({"date": date});
          await documentReference
              .collection("time")
              .doc(data["time"])
              .set(data);
        }

        QuerySnapshot appointQuerySnapshot = await FirebaseFirestore.instance
            .collection("apointment")
            .doc(date)
            .collection("time")
            .get();

        for (QueryDocumentSnapshot appointmentDocument
            in appointQuerySnapshot.docs) {
          appointmentDocument.reference.update({"isBlocked": true});
        }

        Get.snackbar("Alert", "Blocking success",backgroundColor: kSuccessSnackbar);
      }
      isLoading=false;
      update();
    } catch (e) {
      Get.snackbar("Warning", "Has error ", backgroundColor: kSuccessSnackbar);
    }
  }
}
