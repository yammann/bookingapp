import 'package:e_store/core/class/status.dart';
import 'package:flutter/material.dart';

class HandlingView extends StatelessWidget {
  const HandlingView({super.key, required this.status, required this.widget});
  final Status status;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return status == Status.offLineFailure
            ? const Scaffold(body: Center(child: Text("off Line failure"),),)
            : status == Status.serverFailure
                ? const Scaffold(body: Center(child: Text("server failure"),),)
                : status == Status.failure
                    ? const Scaffold(body: Center(child: Text("No Data"),),)
                    : status == Status.success
                        ? widget
                        : const Scaffold(body: Center( child: Text("has error"),),);
  }
}
