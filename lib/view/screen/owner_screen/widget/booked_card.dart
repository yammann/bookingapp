import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';

class BookedCard extends StatelessWidget {
  const BookedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kOnBoardingBG),
                child:  Column(
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/person.jpeg"),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Column(
                            children: [
                              UserDetailesRow(
                                  title: "User Name", value: "Yaman Cawad"),
                              UserDetailesRow(
                                  title: "Time", value: "09:00 - 10:00"),
                              UserDetailesRow(title: "Detail", value: "Hair cut"),
                            ],
                          ),
                        ),
                      ],
                    ),
                     IconButton(onPressed: () {}, icon: const Icon(Icons.cancel,color: Colors.red,size: 40,)),
                  ],
                ),
              );
  }
}