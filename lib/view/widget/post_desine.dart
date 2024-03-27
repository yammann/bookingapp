import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/post_model.dart';
import 'package:e_store/view/widget/cached_network_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostDesign extends StatelessWidget {
  const PostDesign(
      {super.key,
      required this.postModel,
      this.onPressedLike,
      required this.isLiked,
      required this.countLike,
      this.onPressedComment});

  final int countComment = 0;
  final PostModel postModel;
  final Function()? onPressedLike;
  final Function()? onPressedComment;
  final bool isLiked;
  final int countLike;
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: kOnBoardingBG),
                        child: CachedImag(
                            isloadin: false, imgProfile: postModel.profilImg,
                            width: 50,
                            height: 50,)),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(postModel.username),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: screenwidth > 600 ? screenheight / 1.5 : screenheight / 2.2,
            child: CachedNetworkImage(
              imageUrl: postModel.postImg,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: onPressedLike,
                  icon: isLiked
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border_outlined)),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: onPressedComment, icon: const Icon(Icons.chat)),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(postModel.describtion),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$countLike ${"likes".tr}",
                  style: const TextStyle(fontSize: 14),
                ),
                TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
                    onPressed: onPressedComment,
                    child:  Text(
                      "view all comment".tr,
                      style: TextStyle(color: Colors.black),
                    )),
                Text(DateFormat.yMMMd().format(postModel.datePublished)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
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
