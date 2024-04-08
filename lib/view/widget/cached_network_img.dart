import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CachedImag extends StatelessWidget {
  const CachedImag({super.key,  this.isloadin=false, required this.imgProfile,  this.width=100,  this.height=100});
final bool isloadin;
final String imgProfile;
final double width;
final double height;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
                      child: isloadin
                          ? const Center(
                              child: CircularProgressIndicator(
                                  color: kOnBoardingP))
                          : CachedNetworkImage(
                              imageUrl: imgProfile,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                              width: width, 
                              height: height, 
                            ),
                    );
  }
}