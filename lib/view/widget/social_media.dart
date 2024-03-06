import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key, this.onTap,
  });
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/google.png")),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}