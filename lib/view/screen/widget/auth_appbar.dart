import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}