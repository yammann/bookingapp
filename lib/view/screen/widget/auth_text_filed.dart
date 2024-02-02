import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthTextFiled extends StatelessWidget {
  const AuthTextFiled({
    super.key, required this.label, required this.hint, required this.icon, this.isObscure=false, this.myController,required this.valid,  this.keyboardType,
  });
  final String label;
  final String hint;
  final Widget icon;
  final bool isObscure;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      validator:valid,
      controller: myController,
      obscureText: isObscure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        labelText:label,
        hintText:hint,
        labelStyle: const TextStyle(height: 0,color: kOnBoardingP),
        suffixIcon: icon,
        suffixStyle: const TextStyle(height: 0,),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 2,
          color: kOnBoardingP,
        style: BorderStyle.solid)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 2,
          
        style: BorderStyle.solid))
      ),
    );
  }
}