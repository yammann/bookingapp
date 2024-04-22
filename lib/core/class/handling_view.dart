import 'package:e_store/core/class/status.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingView extends StatelessWidget {
  const HandlingView({super.key, required this.status, required this.widget});
  final Status status;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    if (status == Status.loading) {
      return Scaffold(
        body: Center(
          child:
              Lottie.asset("assets/lottie/loading.json", height: 50, width: 50),
        ),
      );
    } else if (status == Status.offLineFailure) {
      return const Scaffold(
        body: Center(
          child: Text("off Line failure"),
        ),
      );
    } else if (status == Status.serverFailure) {
      return Scaffold(
        body: Center(
          child: Lottie.asset("assets/lottie/404error.json",
              height: 50, width: 50),
        ),
      );
    } else if (status == Status.failure) {
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
