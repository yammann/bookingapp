import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  Future<void> signUp(UserModel userModel) async {
    try {
      //signup autentication
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password);
      //storge
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set(userModel.toJson()).then((value) {
        print('Data added successfully!');
      }).catchError((error) {
        print('Error adding data: $error');
      });
      credential.user!.sendEmailVerification();
      Get.offNamed(AppRoute.login);
    } on Exception catch (e) {
      print("Signup failed: $e");
    }
  }
}
