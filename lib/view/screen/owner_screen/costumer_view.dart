import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumerView extends StatelessWidget {
  CostumerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title:  Text("Customers".tr),
      ),
      body: Center(
        child: Container(
          width: Get.width > 600 ? 600 : double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: GetBuilder<UserProfileControllerImp>(
            init: UserProfileControllerImp(),
            builder: (controller) {
              return ListView.builder(
                itemCount:controller.isCustomer? controller.users.length: controller.barbers.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: kOnBoardingP))),
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:controller.isCustomer? controller.users[index].imgProfile: controller.barbers[index].imgProfile,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(controller.isCustomer? controller.users[index].userName!: controller.barbers[index].userName!),
                       
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
