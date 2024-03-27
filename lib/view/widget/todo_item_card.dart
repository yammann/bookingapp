import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({
    super.key,
    required this.todoItem,
    this.onTap,
    this.onTapIcon,
    required this.icon,
  });

  final TodoItem todoItem;
  final Function()? onTapIcon;
  final Function()? onTap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all( 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kOnBoardingBG),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todoItem.label,
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "(${todoItem.time} ${"minute".tr})",
                  style: const TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: onTapIcon, icon: icon)
              ],
            )
          ],
        ),
      ),
    );
  }
}
