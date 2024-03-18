import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:get/get.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});
  final MyServices myServices = Get.find();
  final UserProfileControllerImp userProfileControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<UserProfileControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              Stack(children: [
                ClipOval(
                  child: CachedNetworkImage(
                          imageUrl: controller.userModel.imgProfile,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: 200, // Adjust the size as needed
                          height: 200, // Adjust the size as needed
                        ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                        backgroundColor: kOnBoardingBG,
                        child: GestureDetector(
                            child: const Icon(Icons.edit_outlined)))),
              ]),
              const Spacer(flex: 1),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: kOnBoardingBG,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      controller.userModel.userName!,
                      style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserDetailesRow(
                            isEdite: true,
                            title: 'Full Name',
                            value: controller.userModel.userName!,
                          ),
                          SizedBox(height: 20),
                          UserDetailesRow(
                            isEdite: true,
                            title: 'Phone Number',
                            value: controller.userModel.phone!,
                          ),
                          SizedBox(height: 20),
                          UserDetailesRow(
                            isEdite: true,
                            title: 'Mail',
                            value: controller.userModel.email,
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      title: "Log out",
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        myServices.sharedPreferences.setBool("login", false);
                        Get.offAllNamed(AppRoute.rest);
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
