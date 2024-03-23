import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatelessWidget {
  const DropdownList({super.key, required this.items, required this.title, this.onChanged});
  final List<UserModel> items;
  final String title;
  final Function(UserModel?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         border:Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50)),
        
      child: DropdownButton<UserModel>(
        isExpanded: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        borderRadius: BorderRadius.circular(25),
        menuMaxHeight: 300,
        hint: Text(title,style: TextStyle(color: kOnBoardingP),),
        onChanged: onChanged,
        items: items.map((UserModel item) {
          return DropdownMenuItem<UserModel>(
            value: item,
            child: Container(
              padding: EdgeInsets.only(bottom: 5,top: 5),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kOnBoardingP))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
              child: CachedNetworkImage(
                imageUrl: item.imgProfile,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: 38,
                height: 50,
              ),
                        ),
                  Text(item.userName!),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
