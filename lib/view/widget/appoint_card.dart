import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';

class AppointCard extends StatelessWidget {
  const AppointCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kOnBoardingBG,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetailesRow(
                  title: "Date", value: "20.10.2024"),
              SizedBox(height: 10),
              UserDetailesRow(
                  title: "Time", value: "10:30 -> 11:30"),
              SizedBox(height: 10),
              UserDetailesRow(
                  title: "Detail", value: "Haire - Chin - Face creme" ),
              SizedBox(height: 10),
               UserDetailesRow(
                  title: "State", value: "Active" ),
              SizedBox(height: 10),
            ],
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  15), // Adjust the value as needed
            ),
            elevation: 0,
            color: const Color.fromARGB(255, 255, 111, 109),
            onPressed: () {},
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}