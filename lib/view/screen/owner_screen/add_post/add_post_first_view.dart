import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/owner_screen/widget/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostFirstView extends StatelessWidget {
  AddPostFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostControllerImp>(
      init: PostControllerImp(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: kOnBoardingBG,
          appBar: AppBar(
            backgroundColor: kOnBoardingBG,
            title:  Text("Add Post".tr),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfileButton(
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            size: 40,
                            color: kOnBoardingP,
                          ),
                          title: "Camera".tr,
                          onPressed: () async {
                            await controller.addImage(ImageSource.camera);
                            controller.isImgPathNotEmpty(controller.imgPaht);
                          },
                        ),
                        ProfileButton(
                          icon: const Icon(
                            Icons.photo,
                            size: 40,
                            color: kOnBoardingP,
                          ),
                          title: "Gallery".tr,
                          onPressed: () async {
                            await controller.addImage(ImageSource.gallery);
                            controller.isImgPathNotEmpty(controller.imgPaht);
                          },
                        )
                      ],
                    ),
          ),
        );
      },
    );
  }
}