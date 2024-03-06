import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DoubleButton extends StatelessWidget {
  const DoubleButton({super.key, this.onTapSpecial, this.onTapNormal});

  final Function()? onTapSpecial;
  final Function()? onTapNormal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: kOnBoardingP, // Color of the right border
                      width: 1.0, // Width of the right border
                    ),
                    bottom: BorderSide(
                      color: kOnBoardingP, // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: onTapNormal,
                  child: const Text(
                    "Normal",
                    style: TextStyle(
                      color: kOnBoardingP,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 48,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: kOnBoardingP, // Color of the right border
                      width: 1.0, // Width of the right border
                    ),
                    bottom: BorderSide(
                      color: kOnBoardingP, // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: onTapSpecial,
                  child: const Text(
                    "Special",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
