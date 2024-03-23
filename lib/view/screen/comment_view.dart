import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/comment_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommentPage extends StatelessWidget {
  CommentPage({
    super.key,
  });
  final CommentControllerImp commentControllerImp =
      Get.put(CommentControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title: const Text("Commentis"),
      ),
      body: GetBuilder<CommentControllerImp>(
        init: CommentControllerImp(),
        builder: (CommentControllerImp controller) {
          return Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: controller.comments.length,
                      itemBuilder: (context, index) {
                        print(controller.comments.length);
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: controller
                                        .comments[index].commenterProImg,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    width: 33, 
                                    height: 33,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .comments[index].commenterUserName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.comments[index].commentText,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      DateFormat.yMMMMd().format(controller
                                          .comments[index].datePublished),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: Get.arguments[1].imgProfile,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: 50, // Adjust the size as needed
                          height: 50, // Adjust the size as needed
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: AuthTextFiled(
                        myController: controller.commentTextController,
                        label: "Add Comment",
                        hint: "Write your comment",
                        icon: IconButton(
                          onPressed: () {
                            if (controller.commentTextController.text != "") {
                              controller.commenting(
                                  postId: Get.arguments[0],
                                  profImg: Get.arguments[1].imgProfile,
                                  username: Get.arguments[1].userName!,
                                  uID: Get.arguments[1].userId);
                            } else {
                              Get.snackbar("Warrning", "this comment is empty");
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
