import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:e_store/core/constants/colors.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/person.jpeg"),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar
              (
                backgroundColor: kOnBoardingBG,
                child: GestureDetector(child: const Icon(Icons.edit_outlined)))),
            ]
          ),
          const Spacer(
            flex: 1
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: kOnBoardingBG, borderRadius: BorderRadius.circular(15)),
            child: const Column(
              children: [
                Text(
                  "Yaman Jawad",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserDetailesRow(
                        isEdite: true,
                        title: 'Full Name',
                        value: 'Yaman Jawad',
                      ),
                      SizedBox(height: 20),
                      UserDetailesRow(
                        isEdite: true,
                        title: 'Phone Number',
                        value: '+9564346543',
                      ),
                      SizedBox(height: 20),
                      UserDetailesRow(
                        isEdite: true,
                        title: 'Mail',
                        value: 'yaman@gmail.com',
                      ),
                      SizedBox(height: 20),
                      UserDetailesRow(
                        isEdite: true,
                        title: 'Password',
                        value: '*******',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
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


