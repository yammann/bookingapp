import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
              backgroundImage: AssetImage("assets/images/google.png")),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
              backgroundImage: AssetImage("assets/images/fec.png")),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/twitt.png"),
          ),
        ],
      ),
    );
  }
}