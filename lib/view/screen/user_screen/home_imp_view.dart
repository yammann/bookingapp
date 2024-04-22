import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/view/widget/post_desine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeImpView extends StatelessWidget {
  HomeImpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostControllerImp>(
      init:PostControllerImp() ,
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              return PostDesign(
                postModel: controller.posts[index],
                onPressedLike: () async {
                  controller.like(controller.posts[index].postId);
                  controller.posts[index].isLiked =
                      !controller.posts[index].isLiked;
                },
                isLiked: controller.posts[index].isLiked,
                countLike: controller.posts[index].liks.length,
                onPressedComment: () async {
                  controller.onPressedComment(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}
