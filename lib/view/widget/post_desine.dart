import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PostDesign extends StatelessWidget {
  const PostDesign({super.key});

final int countComment = 0;
// final PostModel postModel;
  // getCountComment() async {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0 ,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage("assets/images/logo.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Amjad Jawad"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: screenwidth > 600 ? screenheight / 1.5 : screenheight / 2.2,
              child: Image.asset(
                "assets/images/logo-color.png",
                fit: BoxFit.fill,
              )),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                   
                  },
                  icon: const Icon(Icons.chat)),
            
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("New model"),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "111 likes",
                  style: TextStyle(fontSize: 18),
                ),
                
                TextButton(
                    style: const ButtonStyle(
                        padding:
                            MaterialStatePropertyAll(EdgeInsets.all(0))),
                    onPressed: () {
                      Get.toNamed(AppRoute.comment);
                     
                    },
                    child: Text(
                      "view all $countComment comment",
                      style: const TextStyle(color: Colors.black),
                    )),
               
                Text(DateFormat.yMMMd().format(DateTime.now())),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: const Divider(
              thickness: 1,
              color: kOnBoardingP,
            ),
          )
        ],
      ),
    );
  }
}
