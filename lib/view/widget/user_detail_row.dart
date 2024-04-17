import 'package:flutter/material.dart';

class UserDetailesRow extends StatelessWidget {
    const UserDetailesRow({
    super.key,
    required this.title,
    required this.value,
    this.isEdite=false, 
    this.onTap
  });
  final String title;
  final String value;
  final bool isEdite;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                "$title : ",
                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child:isEdite? const Icon(Icons.edit_outlined):const Text(""),
        )
      ],
    );
  }
}