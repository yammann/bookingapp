import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/core/function/img_storge_and_get_url.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show basename;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserProfileController extends GetxController {
  changeProfileImg(ImageSource imgSorc);
  changeUserName();
  isImageLod();
  changePhoneNumber();  
  countcoustumer();
  getUsers();

}

class UserProfileControllerImp extends UserProfileController {

  int countCoustumer=0;

  late UserModel userModel;

  late String? imgName;

  Uint8List? imgPaht;

  bool isloadin = false;

  final User currentUser = FirebaseAuth.instance.currentUser!;

  List<UserModel>users=[];

  late  UserModel owner;

  TextEditingController userNameControler=TextEditingController();

  TextEditingController phoneControler=TextEditingController();

  @override
  changeProfileImg(ImageSource imgSorc) async {
    final picImag = await ImagePicker().pickImage(source: imgSorc);
    try {
      if (picImag != null) {
        imgPaht = await picImag.readAsBytes();

        imgName = basename(picImag.path);
        int randum = Random().nextInt(9999999);
        imgName = "$randum$imgName";

        isImageLod();
        Get.back();
        dynamic profilImg = await imgStorgeAndGetUrl(
            imgName: imgName!,
            imgPaht: imgPaht!,
            foldername: "userProfailImg/${currentUser.uid}");

        FirebaseFirestore.instance.collection("users").doc(currentUser.uid).update({
          "imgProfile": profilImg,
        });
        userModel = await getUserData(currentUser.uid);

        update();

        isImageLod();
      } else {
        
      }
    } catch (e) {
      Get.snackbar( "Warning".tr, "error".tr);
    }
    Get.back();
  }

  @override
  isImageLod() {
    isloadin = !isloadin;
    update();
  }

  @override
  void onInit() async {
    userModel = await getUserData(currentUser.uid);
    owner=await getUserData(ownerUserId);
      countcoustumer();
      await getUsers() ;
    super.onInit();
  }

  @override
  void dispose() {
    phoneControler.dispose();
    userNameControler.dispose();
    super.dispose();
  }
  
  @override
  changeUserName()async {
    try {
      FirebaseFirestore.instance.collection("users").doc(currentUser.uid).update({
          "userName": userNameControler.text,
        });
        userModel = await getUserData(currentUser.uid);

        update();
        Get.back();
    } catch (e) {
      Get.snackbar("Warning", "Has error");
    }
  } @override

  changePhoneNumber()async {
    try {
      FirebaseFirestore.instance.collection("users").doc(currentUser.uid).update({
          "phone": phoneControler.text,
        });
        userModel = await getUserData(currentUser.uid);

        update();
        Get.back();
    } catch (e) {
      Get.snackbar("Warning", "Has error");
    }
  }

   @override
  countcoustumer()async {
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection("users").get();
    countCoustumer=querySnapshot.size;
    update();
  }
  
 

  @override
  getUsers() async{
    try {
      QuerySnapshot usersQuerySnapshot=await FirebaseFirestore.instance.collection("users").get();
      for(DocumentSnapshot usersDocumentSnapshot in usersQuerySnapshot.docs){
        UserModel userModel=UserModel.fromJson(usersDocumentSnapshot.data() as Map<String,dynamic>);
        users.add(userModel);
      }
      update();
    } catch (e) {
      Get.snackbar("warrning", "has error");
    }
  }
}
