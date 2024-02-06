import 'package:e_store/view/screen/widget/auth_appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      AuthAppBar(title: "Home"),
    );
  }
}