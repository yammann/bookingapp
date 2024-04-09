import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/screen/owner_screen/widget/profile_button.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:e_store/view/widget/cached_network_img.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});
  final MyServices myServices = Get.find();
  final UserProfileControllerImp userProfileControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.all(15),
        child: GetBuilder<UserProfileControllerImp>(
          init: UserProfileControllerImp(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Stack(children: [
                    Container(
                        padding: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kOnBoardingBG,
                        ),
                        child: CachedImag(
                          isloadin: controller.isloadin,
                          imgProfile: controller.userModel.imgProfile,
                          width: 150,
                          height: 150,
                        )),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: kOnBoardingBG,
                            child: GestureDetector(
                                child: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          backgroundColor: kOnBoardingBG,
                                          title: "Select".tr,
                                          content: Column(
                                            children: [
                                              ProfileButton(
                                                  icon: const Icon(Icons
                                                      .camera_alt_outlined),
                                                  title: "Camera".tr,
                                                  onPressed: () {
                                                    controller.changeProfileImg(
                                                        ImageSource.camera);
                                                  }),
                                              const SizedBox(height: 10),
                                              ProfileButton(
                                                icon: const Icon(Icons.photo),
                                                title: "Gallery".tr,
                                                onPressed: () {
                                                  controller.changeProfileImg(
                                                      ImageSource.gallery);
                                                },
                                              ),
                                            ],
                                          ));
                                    },
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      size: 15,
                                    ))))),
                  ]),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: kOnBoardingBG,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Text(
                          controller.userModel.userName!,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserDetailesRow(
                                isEdite: true,
                                title: 'Full Name'.tr,
                                value: controller.userModel.userName!,
                                onTap: () {
                                  Get.defaultDialog(
                                    backgroundColor: kOnBoardingBG,
                                    title: "Change User Name".tr,
                                    contentPadding: const EdgeInsets.all(20),
                                    content: AuthTextFiled(
                                      valid: (val) {
                                        return validation(
                                            val, 4, 20, Type.userName);
                                      },
                                      keyboardType: TextInputType.name,
                                      label: "User Name".tr,
                                      hint: "Enter new user name".tr,
                                      myController:
                                          controller.userNameControler,
                                    ),
                                    onCancel: () {},
                                    onConfirm: () {
                                      controller.changeUserName();
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 15),
                              UserDetailesRow(
                                isEdite: true,
                                title: "Phone number".tr,
                                value: controller.userModel.phone!,
                                onTap: () {
                                  Get.defaultDialog(
                                    backgroundColor: kOnBoardingBG,
                                    title: "Change phone number".tr,
                                    contentPadding: const EdgeInsets.all(20),
                                    content: AuthTextFiled(
                                      valid: (val) {
                                        return validation(
                                            val, 5, 15, Type.phoneNumber);
                                      },
                                      label: "Phone number".tr,
                                      hint: "Enter new phone number".tr,
                                      myController: controller.phoneControler,
                                      keyboardType: TextInputType.phone,
                                    ),
                                    onCancel: () {},
                                    onConfirm: () {
                                      controller.changePhoneNumber();
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 15),
                              UserDetailesRow(
                                isEdite: false,
                                title: 'Email'.tr,
                                value: controller.userModel.email,
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        AppButton(
                          title: "Log out".tr,
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            myServices.sharedPreferences
                                .setBool("login", false);
                            Get.offAllNamed(AppRoute.login);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppButton(
                          title: "Change Language".tr,
                          onTap: () {
                            Get.toNamed(AppRoute.language);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppButton(
                          title: "Change Password",
                          onTap: () {
                            controller.changePassword();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
