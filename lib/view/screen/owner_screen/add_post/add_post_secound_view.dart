import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/cached_network_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostSecoundView extends StatelessWidget {
  AddPostSecoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostControllerImp>(
      init: PostControllerImp(),
      builder: (controller) {
        return Scaffold(
             backgroundColor: kOnBoardingBG,
              appBar: AppBar(
                 backgroundColor: kOnBoardingBG,
                actions: [
                  TextButton(
                      onPressed: () {
                       controller.addPost();
                      },
                      child:  Text(
                        "Post".tr,
                        style: TextStyle(fontSize: 18),
                      ))
                ],
                
              ),
              body: Column(
                children: [
                  controller.isloadin?const LinearProgressIndicator(color: kOnBoardingP,): const Divider(thickness: 1,),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       CachedImag(imgProfile: controller.userModel.imgProfile, isloadin: controller.isloadin,height: 50,width: 50,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        height: 60,
                        child: TextField(
                          controller: controller.describtioncontroller,
                          decoration:
                               InputDecoration(hintText: "write a captions".tr),
                        ),
                      ),
                      SizedBox(height: 60,
                      width: 100,child: Image.memory(controller.imgPaht!,fit: BoxFit.cover,),)
                    ],
                  ),
                ],
              )
              );
      },
    );
  }
}
