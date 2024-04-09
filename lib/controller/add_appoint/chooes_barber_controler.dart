import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/check_if_snackbar_is_active.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class ChooesBarberController extends GetxController {
  getBarbers();
  onTapBarber(int index);
}

class ChooesBarberControllerImp extends ChooesBarberController {


  late UserModel userModel;

  final User currentUser = FirebaseAuth.instance.currentUser!;

  List<UserModel> barbers = [];

  @override
  void onInit() async {
    userModel = await getUserData(currentUser.uid);
    await getBarbers();
    super.onInit();
  }

  
 
  @override
  getBarbers() async {
    try {
      QuerySnapshot usersQuerySnapshot =
          await FirebaseFirestore.instance.collection("barber").get();
      for (DocumentSnapshot usersDocumentSnapshot in usersQuerySnapshot.docs) {
        UserModel userModel = UserModel.fromJson(
            usersDocumentSnapshot.data() as Map<String, dynamic>);
        barbers.add(userModel);
      }
      update();
    } catch (e) {
      isActiveSnackbar();
      Get.snackbar("Warning".tr, "error".tr);
    }
  }
  
  @override
  onTapBarber(int index) {
   Get.toNamed(AppRoute.addappoint,arguments: barbers[index]);
  }

 
}
