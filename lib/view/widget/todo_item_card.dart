import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({super.key, required this.label, required this.isSelected, this.onChanged});

  final String label;
  final bool isSelected;
   final Function(bool?)? onChanged;
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Checkbox(
            activeColor: kOnBoardingP,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            value: isSelected,
            onChanged: onChanged
          )
        ],
      ),
    );
  }
}
