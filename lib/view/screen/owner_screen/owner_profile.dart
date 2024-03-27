import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/view/screen/owner_screen/widget/profile_button.dart';
import 'package:e_store/view/widget/cached_network_img.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerProfileView extends StatelessWidget {
  OwnerProfileView({super.key});
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<UserProfileControllerImp>(
          init: UserProfileControllerImp(),
          builder: (controller) {
            return Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:kOnBoardingBG,
                  ),
                  child: CachedImag(imgProfile: controller.userModel.imgProfile,isloadin: controller.isloadin,)
                ),
                 SizedBox(
                  width: 40,
                ),
                 Expanded(
                  child: InkWell(
                    onTap: (){Get.toNamed(AppRoute.costumerView);},
                    child: Column(
                      children: [
                        Text(
                          controller.countCoustumer.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                         Text("Customers".tr),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
          },
        ),
        const Divider(
          color: kOnBoardingP,
          thickness: 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             ProfileButton(
              onPressed: () {
                Get.toNamed(AppRoute.profile);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              title: "Edit Profile".tr,
            ),
            ProfileButton(
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
                color: Colors.black,
              ),
              title: "Add Post".tr,
              color: Colors.green[200],
              onPressed: () async {
                Get.toNamed(AppRoute.addPost);
              },
            ),
            ProfileButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: "Logout".tr,
              color: Colors.red[200],
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                myServices.sharedPreferences.setBool("login", false);
                Get.offAllNamed(AppRoute.rest);
                // await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
        const Divider(
          color: kOnBoardingP,
          thickness: 0.5,
        ),
        Expanded(
          child: GetBuilder<PostControllerImp>(
            init: PostControllerImp(),
            builder: (controller) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 10,
                ),
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      Get.defaultDialog(
                        backgroundColor: kOnBoardingBG,
                        title: "Are you need delete this post".tr,
                        middleText: "",
                        onCancel: () {},
                        onConfirm: () {
                          controller.deletPost(controller.posts[index].imgPath,controller.posts[index].postId);
                        },
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: controller.posts[index].postImg,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
