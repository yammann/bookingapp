import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/function/appointment_exceed.dart';
import 'package:e_store/core/function/launch_url.dart';
import 'package:e_store/core/function/send_mesage_to_email.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BookedAppointmentController extends GetxController {
  onSelectedDay(DateTime selectedDay, DateTime focusedDay);
  call(AppointmentModel appointmentModel, bool isBlocking);
  cancelAndAvailableAppointment(String appointmentId, String documentId);
  cancelAndBlockedAppointment(String appointmentId, String date);
  getSnapshots(String documentId);
  sendEmail(AppointmentModel appointmentModel, bool isBlocking);
}

class BookedAppointmentControllerImp extends BookedAppointmentController {
  bool holiday = true;
  DateTime isSelectedDay = DateTime.now();
  bool isBlocked = false;
  late Stream<QuerySnapshot<Object?>> appointQuerySnapshot;

  final List<AppointmentModel> bookedAppointList = [];

  @override
  void onInit() {
    super.onInit();
    appointmentIfExceed(isSelectedDay.toString().substring(0, 10));
    if (DateTime.now().weekday == DateTime.wednesday ||
        DateTime.now().weekday == DateTime.sunday) {
    } else {
      holiday = false;
      getSnapshots(isSelectedDay.toString().substring(0, 10));
    }
  }

  @override
  onSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    bookedAppointList.clear();
    update();
    if (selectedDay.weekday == DateTime.wednesday ||
        selectedDay.weekday == DateTime.sunday) {
      holiday = true;
    } else {
      holiday = false;
      isSelectedDay = selectedDay;
      getSnapshots(selectedDay.toString().substring(0, 10));
    }
    update();
  }

  @override
  cancelAndAvailableAppointment(String appointmentId, String documentId) async {
      CollectionReference appointCollection = FirebaseFirestore.instance
          .collection("apointment")
          .doc(documentId)
          .collection("time");

      QuerySnapshot appointQuerySnapshot =
          await appointCollection.where("appointmentId", isEqualTo: appointmentId).get();
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
          "isBlocked": false,
          "duration":null,
          "appointmentId":null,
        });
      }
    
    Get.back();
  }

  @override
  cancelAndBlockedAppointment(String appointmentId, String date) async {
     CollectionReference appointCollection = FirebaseFirestore.instance
          .collection("apointment")
          .doc(date)
          .collection("time");

      QuerySnapshot appointQuerySnapshot =
          await appointCollection.where("appointmentId", isEqualTo: appointmentId).get();
      for (QueryDocumentSnapshot appointDocumentSnapshot
          in appointQuerySnapshot.docs) {
        DocumentReference appointDocumentReference =
            appointDocumentSnapshot.reference;
        appointDocumentReference.update({
          "isBlocked": true,
        });
      }
      Get.back();
  }

  @override
  void call(AppointmentModel appointmentModel, bool isBlocking) async {
    DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(appointmentModel.userId)
        .get();

    UserModel userModel = UserModel.fromJson(snap.data()!);
    final Uri url = Uri.parse('tel:${userModel.phone}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
    if (!isBlocking) {
      await cancelAndAvailableAppointment(appointmentModel.appointmentId!,
          appointmentModel.date!);
    } else {
      await cancelAndBlockedAppointment(
          appointmentModel.appointmentId!, appointmentModel.date!);
    }
  }

  @override
  getSnapshots(String documentId) async {
    CollectionReference appointCollection = FirebaseFirestore.instance
        .collection("apointment")
        .doc(documentId)
        .collection("time");

    appointQuerySnapshot =
        appointCollection.where("state", isEqualTo: false).snapshots();

    appointQuerySnapshot.listen((QuerySnapshot snapshot) {
      List<AppointmentModel> uniqueAppointments = [];

      for (QueryDocumentSnapshot document in snapshot.docs) {
        AppointmentModel appointmentModel =
            AppointmentModel.fromJson(document.data() as Map<String, dynamic>);

        bool appointmentExists = uniqueAppointments.any((existingAppointment) =>
            existingAppointment.appointmentId == appointmentModel.appointmentId);
        if (!appointmentExists) {
          if(!appointmentModel.appointmentExceed){
            uniqueAppointments.add(appointmentModel);
          }
        } 
      }
      bookedAppointList.clear();
      bookedAppointList.addAll(uniqueAppointments);
      update();
    });
  }
  
  @override
  sendEmail(AppointmentModel appointmentModel, bool isBlocking)async {
     DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(appointmentModel.userId)
        .get();

    UserModel userModel = UserModel.fromJson(snap.data()!);
    // sendMesageToEmail(userModel.email,
    // "Jawad Barber",
    // """Dear customer:
    //  we apologize for canceling your scheduled appointment on the date
    //  of ${appointmentModel.date}  ${appointmentModel.time}
    //  due to an emergency""");
    launchSendEmail(userModel.email,
    "Jawad Barber",
    """Dear customer:
     we apologize for canceling your scheduled appointment on the date
     of ${appointmentModel.date}  ${appointmentModel.time}
     due to an emergency""");
     
    if (!isBlocking) {
      await cancelAndAvailableAppointment(appointmentModel.appointmentId!,
          appointmentModel.date!);
    } else {
      await cancelAndBlockedAppointment(
          appointmentModel.appointmentId!, appointmentModel.date!);
    }
  }
}
