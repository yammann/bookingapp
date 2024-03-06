import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

MyServices myServices = Get.find();
final GoogleSignIn googleSignIn = GoogleSignIn();

class Auth {
  Future<void> signUp(UserModel userModel) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password);

      credential.user!.sendEmailVerification();

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userModel.toMap())
          .then((value) {
        print('Data added successfully!');
      }).catchError((error) {
        print('Error adding data: $error');
      });
      Get.snackbar("Verification".tr, "VerificationMSG".tr);
      Get.toNamed(AppRoute.verifyCodeSignUp);
    } on Exception catch (e) {
      Get.snackbar(
          "Warning".tr, "haveAccountWarrning".tr,
          backgroundColor: Colors.redAccent);
      print("Signup failed: $e");
    }
  }

  Future<void> login(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      User user = userCredential.user!;
      print("-----------------------------${user.email}");
      myServices.sharedPreferences.setBool("login", true);
      if (user.email == "amjad@gmail.com") {
        Get.offNamed(AppRoute.ownerHome);
        print("owner");
        myServices.sharedPreferences.setBool("owner", true);
        print("owner 1");
      } else {
        Get.offNamed(AppRoute.home);
        print("home");

        myServices.sharedPreferences.setBool("owner", false);
        print("home 1");
      }

      print("User logged in: ${user.uid}");
    } catch (e) {
      print("Login failed: $e");
    }
  }

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in process
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User user = userCredential.user!;
      bool isUserRegistered = await isEmailRegistered(user.email!);
      if (isUserRegistered) {
        // User is registered, proceed with login
        if (user.email == "amjad@gmail.com") {
          Get.offNamed(AppRoute.ownerHome);
          myServices.sharedPreferences.setBool("owner", true);
        } else {
          Get.offNamed(AppRoute.home);
          myServices.sharedPreferences.setBool("owner", false);
        }
      } else {
        Get.snackbar("Warning".tr,"dontHaveAccountWarrning".tr);
        Get.offNamed(AppRoute.signUp);
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  void checkEmailRegistration(String email) async {
    bool isRegistered = await isEmailRegistered(email);

    if (isRegistered) {
      print('Email is already registered.');
    } else {
      print('Email is not registered.');
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: 'dummyPassword');

      // If there is a user, the email is already registered
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      // If the error code is 'user-not-found', the email is not registered
      if (e.code == 'user-not-found') {
        return false;
      }
      // Handle other errors as needed
      print('Error checking email registration: $e');
      return false;
    }
  }
}
