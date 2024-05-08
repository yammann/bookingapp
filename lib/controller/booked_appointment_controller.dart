import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/class/local_noification.dart';
import 'package:e_store/core/function/appointment_exceed.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/core/function/launch_url.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BookedAppointmentController extends GetxController {
  onSelectedDay(DateTime selectedDay, DateTime focusedDay);
  call(AppointmentModel appointmentModel, bool isBlocking);
  cancelAndAvailableAppointment(String appointmentId, String documentId);
  cancelAndBlockedAppointment(String appointmentId, String date);
  getSnapshots(String documentId);
  sendEmail(AppointmentModel appointmentModel, bool isBlocking);
  isHoliday(DateTime isDay);
}

class BookedAppointmentControllerImp extends BookedAppointmentController {
  bool holiday = false;
  DateTime isSelectedDay = DateTime.now();
  bool isBlocked = false;
  late Stream<QuerySnapshot<Object?>> appointQuerySnapshot;
  User currentUser = FirebaseAuth.instance.currentUser!;
  final List<AppointmentModel> bookedAppointList = [];
  final UserProfileControllerImp userProfileControllerImp=Get.find();
  

  @override
  void onInit() async {
    super.onInit();
    
    await appointmentIfExceed(isSelectedDay.toString().substring(0, 10));
    isHoliday(isSelectedDay);
    if (holiday) {
    } else {
      holiday = false;
      getSnapshots(isSelectedDay.toString().substring(0, 10));
    }
  }

  @override
  onSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    bookedAppointList.clear();
    update();
    isHoliday(selectedDay);
    if (holiday) {
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
        .collection("barber")
        .doc(userProfileControllerImp.userModel.userId)
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
        "isBlocked": false,
        "duration": null,
        "appointmentId": null,
        "barberId": null,
        "barberName": null,
      });
    }

    Get.back();
    LocalNotification.cancel(2);
  }

  @override
  cancelAndBlockedAppointment(String appointmentId, String date) async {
    CollectionReference appointCollection = FirebaseFirestore.instance
        .collection("barber")
        .doc(userProfileControllerImp.userModel.userId)
        .collection("apointment")
        .doc(date)
        .collection("time");

    QuerySnapshot appointQuerySnapshot = await appointCollection
        .where("appointmentId", isEqualTo: appointmentId)
        .get();
    for (QueryDocumentSnapshot appointDocumentSnapshot
        in appointQuerySnapshot.docs) {
      DocumentReference appointDocumentReference =
          appointDocumentSnapshot.reference;
      appointDocumentReference.update({
        "isBlocked": true,
      });
    }
    Get.back();
    LocalNotification.cancel(2);
  }

  @override
  void call(AppointmentModel appointmentModel, bool isBlocking) async {
    DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(appointmentModel.userId)
        .get();

    UserModel userModelForCancel = UserModel.fromJson(snap.data()!);
    final Uri url = Uri.parse('tel:${userModelForCancel.phone}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
    if (!isBlocking) {
      await cancelAndAvailableAppointment(
          appointmentModel.appointmentId!, appointmentModel.date!);
    } else {
      await cancelAndBlockedAppointment(
          appointmentModel.appointmentId!, appointmentModel.date!);
    }
  }

  @override
  getSnapshots(String documentId) async {
    CollectionReference appointCollection = FirebaseFirestore.instance
        .collection("barber")
        .doc(userProfileControllerImp.userModel.userId)
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
            existingAppointment.appointmentId ==
            appointmentModel.appointmentId);
        if (!appointmentExists) {
          if (!appointmentModel.appointmentExceed) {
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
  sendEmail(AppointmentModel appointmentModel, bool isBlocking) async {
    DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(appointmentModel.userId)
        .get();

    UserModel userModel = UserModel.fromJson(snap.data()!);

    launchSendEmail(
        userModel.email,
        "Jawad Barber",
        "canselMsg1".tr +
            appointmentModel.date! +
            appointmentModel.time +
            "canselMsg2".tr);

    if (!isBlocking) {
      await cancelAndAvailableAppointment(
          appointmentModel.appointmentId!, appointmentModel.date!);
    } else {
      await cancelAndBlockedAppointment(
          appointmentModel.appointmentId!, appointmentModel.date!);
    }
  }

  @override
  isHoliday(DateTime isDay) {
     for(int day in userProfileControllerImp.userModel.holidays){
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
