import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

MyServices myServices = Get.find();
final GoogleSignIn googleSignIn = GoogleSignIn();

class Auth {
  Future<void> signUp(
      String password, String phone, String email, String userName) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      credential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          userId: credential.user!.uid,
          email: email,
          password: password,
          phone: phone,
          userName: userName,
          holidays: [1],
          role: Role.customer);

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(userModel.toMap())
          .then((value) {})
          .catchError((error) {});
      Get.snackbar("Verification".tr, "VerificationMSG".tr);
      Get.toNamed(AppRoute.verifyCodeSignUp);
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        Get.snackbar("Warning".tr, "haveAccountWarrning".tr,
            backgroundColor: kWorrningSnackbar);
      } else {
        Get.snackbar("Warning".tr, 'Error: $e',
            backgroundColor: kWorrningSnackbar);
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        UserModel userModel = await getUserData(user!.uid);

        // Set login status and user type in SharedPreferences
        myServices.sharedPreferences.setBool("login", true);

        // Redirect user based on their type
        if (userModel.role == Role.customer) {
          Get.offNamed(AppRoute.home);
          myServices.sharedPreferences.setString("role", "customer");
          print("User is an customer");
        } else if (userModel.role == Role.barber) {
          Get.offNamed(AppRoute.barberView);
          myServices.sharedPreferences.setString("role", "barber");
          print("User is not an owner");
        } else if (userModel.role == Role.owner) {
          Get.offNamed(AppRoute.ownerHome);
          myServices.sharedPreferences.setString("role", "owner");
          print("User is not an owner");
        }

        print("User logged in: ${user.uid}");
      }
    } catch (e) {
      // Handle authentication errors
      if (e is FirebaseAuthException) {
      Get.snackbar("Warning".tr, "passwordOremail".tr);
      } else {
        // Handle other unexpected errors
        Get.snackbar("Warning".tr, "error1".tr);
      }
    }
  }

  // Future<void> login(String email,String password) async {
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password:password,
  //     );

  //     User user = userCredential.user!;
  //     myServices.sharedPreferences.setBool("login", true);
  //     if (user.email == "buzzard.black19977@gmail.com") {
  //       Get.offNamed(AppRoute.ownerHome);
  //       print("owner");
  //       myServices.sharedPreferences.setBool("owner", true);
  //       print("owner 1");
  //     } else {
  //       Get.offNamed(AppRoute.home);
  //       print("home");

  //       myServices.sharedPreferences.setBool("owner", false);
  //       print("home 1");
  //     }

  //     print("User logged in: ${user.uid}");
  //   } catch (e) {
  //     Get.snackbar("Warning".tr, "passwordOremail".tr);
  //   }
  // }
}
