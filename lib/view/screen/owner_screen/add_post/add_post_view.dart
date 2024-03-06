import 'package:e_store/controller/add_post_controller.dart';
import 'package:e_store/view/screen/owner_screen/add_post/add_post_first_view.dart';
import 'package:e_store/view/screen/owner_screen/add_post/add_post_secound_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

  final AddPostControllerImp addPostControllerImp =
      Get.put(AddPostControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPostControllerImp>(
      builder: (controller) {
        return controller.secound ?  AddPostSecoundView():AddPostFirstView();
      },
    );
  }
}
