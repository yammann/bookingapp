import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

abstract class CommentController extends GetxController {
  commenting({
    required String postId,
    required String profImg,
    required String username,
    required String uID,
  });
  fetchComments(String postId);
}

class CommentControllerImp extends CommentController {
  final commentTextController = TextEditingController();
  List<CommentModel> comments = [];
  @override
  commenting({
    required String postId,
    required String profImg,
    required String username,
    required String uID,
  }) async {
    dynamic commentId = const Uuid().v1();
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .doc(commentId)
        .set({
      "commenterProImg": profImg,
      "commenterUserName": username,
      "commentText": commentTextController.text,
      "datePublished": DateTime.now(),
      "commenterId": uID,
      "commentId": commentId,
    });
    commentTextController.clear();
    fetchComments(Get.arguments[0]);
  }

  @override
  void dispose() {
    commentTextController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchComments(Get.arguments[0]);
  }

  @override
  fetchComments(String postId) async {
    List<CommentModel> listForImplement = [];
    try {
      QuerySnapshot commentQuerySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .doc(postId)
          .collection("comments")
          .orderBy("datePublished")
          .get();
      for (QueryDocumentSnapshot commentQueryDocumentSnapshot
          in commentQuerySnapshot.docs) {
        CommentModel commentModel = CommentModel.fromJson(
            commentQueryDocumentSnapshot.data() as Map<String, dynamic>);
            listForImplement.add(commentModel);
      }
      comments=listForImplement;
      update();
      print(comments);
    } catch (e) {
      print(e);
    }
  }
}
