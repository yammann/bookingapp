import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({
    super.key,
    required this.label,
    this.onTap,
    this.onTapIcon,
    this.icon,
  });

  final String label;
  final Function()? onTapIcon;
  final Function()? onTap;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kOnBoardingBG),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
            InkWell(onTap: onTapIcon, child: icon)
          ],
        ),
      ),
    );
  }
}
