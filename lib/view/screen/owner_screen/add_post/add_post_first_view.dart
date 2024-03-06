import 'package:e_store/controller/add_post_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/owner_screen/widget/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostFirstView extends StatelessWidget {
  AddPostFirstView({super.key});

  final AddPostControllerImp addPostControllerImp = Get.put(AddPostControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPostControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: kOnBoardingBG,
          appBar: AppBar(
            backgroundColor: kOnBoardingBG,
            title: const Text("Add Post"),
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
                          title: "Camera",
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
                          title: "Gallery",
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