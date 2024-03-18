import 'package:e_store/controller/post_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/post_model.dart';
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
                      child: const Text(
                        "Post",
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
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/person.jpeg")//NetworkImage(userData!.url),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        height: 60,
                        child: TextField(
                          controller: controller.describtioncontroller,
                          decoration:
                              const InputDecoration(hintText: "write a captions......."),
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
