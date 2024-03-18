import 'package:e_store/core/class/status.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookedApointHandlingView extends StatelessWidget {
  const BookedApointHandlingView(
      {super.key, required this.widget, this.snapshot});
  final Widget widget;
  final dynamic snapshot;
  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Scaffold(
        body: Center(
          child:
              Lottie.asset("assets/lottie/loading.json", height: 50, width: 50),
        ),
      );
    } else if (snapshot.hasError) {
      return Scaffold(
        body: Center(
          child: Lottie.asset("assets/lottie/404error.json",
              height: 50, width: 50),
        ),
      );
    } else if (!snapshot.hasData || snapshot.data == null) {
      return Scaffold(
        body: Center(
          child:
              Lottie.asset("assets/lottie/nodata.json", height: 50, width: 50),
        ),
      );
    } else {
      return widget;
    }
  }
}
