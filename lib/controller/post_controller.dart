import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/class/post_method.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/core/function/img_storge_and_get_url.dart';
import 'package:e_store/data/model/post_model.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show basename;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

abstract class PostController extends GetxController {
  addImage(ImageSource imgSorc);
  isImgPathNotEmpty(Uint8List? imgPaht);
  addPost();
  isPostLod();
  getPosts();
  like(String postId);
  deletPost(String imgPath, String postId);
  onPressedComment(int index);
}

class PostControllerImp extends PostController {

  late String? imgName;

  Uint8List? imgPaht;

  bool secound = false;

  bool isloadin = false;

  final Map data = {};

  final describtioncontroller = TextEditingController();

  final User currentUser = FirebaseAuth.instance.currentUser!;

  late UserModel userModel;

  String kPostId = const Uuid().v1();

  List<PostModel> posts = [];

  PostMethod postMethod = PostMethod();

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
        Get.snackbar( "Warning".tr, "error".tr);
      }
    } catch (e) {
      Get.snackbar( "Warning".tr, "error".tr);
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
    isPostLod();
    dynamic postImg = await imgStorgeAndGetUrl(
        imgName: imgName!, imgPaht: imgPaht!, foldername: "imgPost/$kPostId");
    UserModel userModel = await getUserData(currentUser.uid);
    await postMethod.posting(
      postModel: PostModel(
          imgPath: "imgPost/$kPostId/$imgName",
          username: userModel.userName!,
          describtion: describtioncontroller.text,
          profilImg: userModel.imgProfile,
          uId: currentUser.uid,
          postId: kPostId,
          postImg: postImg,
          datePublished: DateTime.now(),
          liks: []),
    );
    getPosts();
    isPostLod();
    secound = false;
    update();
  }

  @override
  isPostLod() {
    isloadin = !isloadin;
    update();
  }

  @override
  getPosts() async {
    List<PostModel> listForImplement = [];

    try {
      QuerySnapshot postQuerySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .orderBy("datePublished", descending: true)
          .get();
      for (QueryDocumentSnapshot postDocumentSnapshot
          in postQuerySnapshot.docs) {
        PostModel postModel = PostModel.fromJson(
            postDocumentSnapshot.data() as Map<String, dynamic>);

        // Check if the current user liked the post
        if (postModel.liks.contains(currentUser.uid)) {
          postModel.isLiked = true;
        } else {
          postModel.isLiked = false;
        }

        listForImplement.add(postModel);
      }
      posts = listForImplement;
      update();
    } catch (e) {
      Get.snackbar( "Warning".tr, "error".tr);
    }
  }

  @override
  void onInit()async {
    userModel=await getUserData(currentUser.uid);
    getPosts();
    super.onInit();
  }

  @override
  like(String postId) async {
    try {
      var postDocumentSnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .doc(postId)
          .get();
      var postData = postDocumentSnapshot.data();

      if (postData != null) {
        List<dynamic> likes = postData["liks"] ?? [];

        if (likes.contains(currentUser.uid)) {
          likes.remove(currentUser.uid);
          update();
        } else {
          likes.add(currentUser.uid);
          update();
        }
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(postId)
            .update({
          "liks": likes,
        });
      }
      getPosts();
    } catch (e) {
      Get.snackbar( "Warning".tr, "error".tr);
    }
  }

  @override
  void dispose() {
    describtioncontroller.dispose();
    super.dispose();
  }

  @override
  deletPost(String imgPath, String postId) async {
    try {
      await FirebaseFirestore.instance.collection("posts").doc(postId).delete();

      await FirebaseStorage.instance.ref().child(imgPath).delete();

      getPosts();
    } catch (e) {
      Get.snackbar("Warning", "Has error", backgroundColor: kWorrningSnackbar);
    }
    Get.back();
    Get.snackbar("Alert", "Post deleted", backgroundColor: kSuccessSnackbar);
   
  }
  
  @override
  onPressedComment(int index) {
    Get.toNamed(AppRoute.comment,arguments: [posts[index].postId, userModel]);
  }
  
  
}
