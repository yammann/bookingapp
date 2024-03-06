import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/post_desine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeImpView extends StatelessWidget {
  const HomeImpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kOnBoardingBG, borderRadius: BorderRadius.circular(20)),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const PostDesign();
        },
      ),
    );
  }
}
