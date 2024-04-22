import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/view/widget/cached_network_img.dart';
import 'package:e_store/view/widget/social_media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileControllerImp userProfileControllerImp = Get.find();
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CachedImag(isloadin: false, imgProfile: userProfileControllerImp.owner.imgProfile,height: 150,width: 150,),
           SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: kOnBoardingBG, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                 Text(
                  "$salonName ${"Hair Salon".tr}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                 Text(
                 "discrabtion".tr,textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Text(
                  "${"Telephon NO"}: $ownerPhoneNumber",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                const SocialMedia()
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
