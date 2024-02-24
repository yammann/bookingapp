import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/widget/social_media.dart';
import 'package:flutter/material.dart';

class HomeImp extends StatelessWidget {
  const HomeImp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/person.jpeg"),
        ),
        const Spacer(
          flex: 1,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: kOnBoardingBG, borderRadius: BorderRadius.circular(15)),
          child: const Column(
            children: [
              Text(
                "Amjad Hair Salon",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Amjad Hair Salon Amjad Hair SalonAmjad Hair Salon Amjad Hair Salon Amjad Hair Salon Amjad Hair Salon Amjad Hair Salon  ",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Text("Telephon NO: +9432434243"),
              SizedBox(
                height: 40,
              ),
              SocialMedia()
            ],
          ),
        ),
        const Spacer(
          flex: 4,
        ),
      ],
    );
  }
}