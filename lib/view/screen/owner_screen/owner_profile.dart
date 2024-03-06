import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/view/screen/owner_screen/widget/profile_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerProfileView extends StatelessWidget {
  OwnerProfileView({super.key});
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage("assets/images/person.jpeg"),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Coustumer"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: kOnBoardingP,
          thickness: 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ProfileButton(
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              title: "Edit Profile",
            ),
             ProfileButton(
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
                color: Colors.black,
              ),
              title: "Add Post",
              color: Colors.green[200],
              onPressed: () async {
                Get.toNamed(AppRoute.addPost);
              },
            ),
            ProfileButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: "Logout",
              color: Colors.red[200],
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                myServices.sharedPreferences.setBool("login", false);
                Get.offAllNamed(AppRoute.login);
                // await FirebaseAuth.instance.signOut();
              },
            ),
           
          ],
        ),
        const Divider(
          color: kOnBoardingP,
          thickness: 0.5,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 10,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Image.asset(
                  "assets/images/logo-color.png",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
