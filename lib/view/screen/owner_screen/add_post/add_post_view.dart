import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/view/screen/owner_screen/add_post/add_post_first_view.dart';
import 'package:e_store/view/screen/owner_screen/add_post/add_post_secound_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostControllerImp>(
      init: PostControllerImp(),
      builder: (controller) {
        return controller.secound ?  AddPostSecoundView():AddPostFirstView();
      },
    );
  }
}
