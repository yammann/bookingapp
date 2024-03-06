import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/appoint_card.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';

class MyAppointView extends StatelessWidget {
  const MyAppointView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return AppointCard();
            },
          ),
        ),
      ],
    );
  }
}


