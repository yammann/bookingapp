import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextFiled extends StatelessWidget {
  const AuthTextFiled({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.isObscure = false,
    this.myController,
    this.valid,
    this.keyboardType, 
    this.inputFormatters,
  });
  final String label;
  final String hint;
  final Widget? icon;
  final bool isObscure;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: valid,
      controller: myController,
      obscureText: isObscure,
      cursorColor: kOnBoardingP,
      cursorHeight: 45,
      cursorRadius: const Radius.circular(5),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(height: 0, color: kOnBoardingP),
        suffixIcon: icon,
        suffixStyle: const TextStyle(
          height: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
              width: 2, color: kOnBoardingP, style: BorderStyle.solid),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 2, style: BorderStyle.solid),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
