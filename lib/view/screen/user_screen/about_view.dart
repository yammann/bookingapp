import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/controller/user_profile_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/data-source/static/static.dart';
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
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: userProfileControllerImp.owner.imgProfile,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: kOnBoardingBG, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                const Text(
                  "Jawad Hair Salon",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                const Text(
                  """What I Offer
            
                  I'm dedicated to providing you with a personalized grooming experience like no other. With years of experience and a passion for my craft, I strive to deliver top-notch service tailored to your needs.
            
                  Using the BarberBook app, you can easily schedule your next haircut with me at your convenience. From classic cuts to modern styles, I'm here to help you achieve the look you desire .""",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Text(
                  "Telephon NO: $userPhoneNumber",
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
