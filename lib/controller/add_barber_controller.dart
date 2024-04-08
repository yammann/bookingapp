import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class AddBarberController extends GetxController {
  addBarber();
  obsure();
}

class AddBarberControllerImp extends AddBarberController {
  final MaskTextInputFormatter phoneNumberFormatter = MaskTextInputFormatter(
    mask: '###-###-####', // Customize the mask as needed
    filter: {"#": RegExp(r'[0-9]')},
  );
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  bool obscure = true;

  @override
  Future<void> addBarber() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .where('email', isEqualTo: emailController.text)
          .get();

      if (snapshot.docs.isEmpty) {
        final UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        UserModel userModel = UserModel(
          userId: credential.user!.uid,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneNumberController.text,
          userName: userNameController.text,
          role: Role.barber,
          holidays: [1],
        );

        FirebaseFirestore userFirestore = FirebaseFirestore.instance;
        userFirestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(userModel.toMap())
            .then((value) {})
            .catchError((error) {});

        FirebaseFirestore barberFirestore = FirebaseFirestore.instance;
        barberFirestore
            .collection('barber')
            .doc(credential.user!.uid)
            .set(userModel.toMap())
            .then((value) {})
            .catchError((error) {});
      } else {
        await snapshot.docs.first.reference
            .update({"role": Role.barber.toString().split('.').last});
        UserModel userModel = UserModel.fromJson(snapshot.docs.first.data());
        FirebaseFirestore barberFirestore = FirebaseFirestore.instance;
        barberFirestore
            .collection('barber')
            .doc(userModel.userId)
            .set(userModel.toMap())
            .then((value) {})
            .catchError((error) {});
      }
      Get.snackbar("Alert".tr, "Success".tr, backgroundColor: kSuccessSnackbar);
      emailController.clear();
      phoneNumberController.clear();
      userNameController.clear();
      passwordController.clear();
      
    } catch (e) {
      Get.snackbar("Warning".tr, 'Error: $e',
          backgroundColor: kWorrningSnackbar);
    }
  }

  @override
  obsure() {
    obscure = !obscure;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    userNameController.dispose();
    super.dispose();
  }
}
