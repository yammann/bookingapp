import 'package:e_store/core/function/launch_url.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){launchWhatsApp();},
            child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/whtasapp.png")
                ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: (){launchURL(ownerTiktok);},
            child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/tiktok.png")),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: (){launchURL(ownerInstagram);},
            child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/instagram.jpeg")),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}