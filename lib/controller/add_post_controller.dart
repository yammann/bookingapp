import 'dart:math';
import 'dart:typed_data';
import 'package:e_store/core/class/post_method.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/core/function/img_storge_and_get_url.dart';
import 'package:e_store/data/model/post_model.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show basename;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

abstract class AddPostController extends GetxController {
  addImage(ImageSource imgSorc);
  isImgPathNotEmpty(Uint8List? imgPaht);
  addPost();
}

class AddPostControllerImp extends AddPostController {
  late String? imgName;

  Uint8List? imgPaht;

  bool secound = false;

  bool isloadin = false;

  final Map data = {};

  final describtioncontroller = TextEditingController();

  final User user=FirebaseAuth.instance.currentUser!;

  String postId = const Uuid().v1();


  @override
  addImage(ImageSource imgSorc) async {
    final picImag = await ImagePicker().pickImage(source: imgSorc);
    try {
      if (picImag != null) {
        imgPaht = await picImag.readAsBytes();

        imgName = basename(picImag.path);
        int randum = Random().nextInt(9999999);
        imgName = "$randum$imgName";
        secound = true;
        update();
      } else {
        print("no image");
      }
    } catch (e) {
      print(e.toString());
    }
    Get.back();
  }

  @override
  isImgPathNotEmpty(Uint8List? imgPaht) {
    if (imgPaht != null) {
      secound = true;
      Get.toNamed(AppRoute.addPost);
      update();
    } else {
      secound = false;
      update();
    }
  }

  @override
  addPost() async {
    isloadin = true;
 dynamic postImg = await imgStorgeAndGetUrl(
          imgName: imgName!,
          imgPaht: imgPaht!,
          foldername: "imgPost/${user.uid}");
    UserModel userModel=await getUserData();      
    await PostMethod()
        .posting(postModel: PostModel(
                        username: userModel.userName!, 
                        describtion:describtioncontroller.text, 
                        profilImg: userModel.imgProfile, 
                        uId: user.uid, 
                        postId: postId, 
                        postImg: postImg, 
                        datePublished: DateTime.now(),
                        liks: []
                        ),);

    isloadin = false;
    secound = false;
    update();
  }
}

  // addImage(ImageSource imgSorc) async {
  //   final picImag = await ImagePicker().pickImage(source: imgSorc);
  //   try {
  //     if (picImag != null) {
  //       imgPaht = await picImag.readAsBytes();
  //       // setState(() {
  //       //   imgName = basename(picImag.path);
  //       //   int randum = Random().nextInt(9999999);
  //       //   imgName = "$randum$imgName";
  //       // });
  //     } else {
  //      print("no image");
  //     }
  //   } catch (e) {
  //     print( e.toString());
  //   }
  //   Navigator.pop(context);
  // }