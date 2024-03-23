
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PostMethod {
  posting({
    required PostModel postModel,
  }) async {
    try {
      CollectionReference posts =
          FirebaseFirestore.instance.collection("posts");
      PostModel post = PostModel(
        imgPath: postModel.imgPath,
          username: postModel.username,
          describtion: postModel.describtion,
          profilImg: postModel.profilImg,
          uId: FirebaseAuth.instance.currentUser!.uid,
          postId: postModel.postId,
          postImg: postModel.postImg,
          datePublished: postModel.datePublished,
          liks: postModel.liks);
      posts.doc(postModel.postId).set(post.convertToMap());
    } catch (e) {
      print(e);
    }
  }

  commenting(
      {required postId,
      required url,
      required commentTextController,
      required username,
      required uID,
      }) async {
    if (commentTextController.isNotEmpty) {
      dynamic commentId = Uuid().v1();
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(postId)
          .collection("comments")
          .doc(commentId)
          .set({
        "commenterProImg": url,
        "commenterUserName": username,
        "commentText": commentTextController,
        "datePublished": DateTime.now(),
        "commenterId": uID,
        "commentId": commentId,
      });
    } else {
      Get.snackbar("Warrning", "this comment is empty");
    }
  }

  
}
