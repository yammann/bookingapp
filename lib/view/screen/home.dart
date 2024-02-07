import 'package:e_store/controller/data/fetch_data_controller.dart';
import 'package:e_store/core/class/handling_view.dart';
import 'package:e_store/core/class/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
 
  @override
  Widget build(BuildContext context) {
     Get.put(FetchDataControllerImp());
    return GetBuilder<FetchDataControllerImp>(
      builder: (FetchDataControllerImp controller) {
        return controller.status==Status.loading?
        const Scaffold(body: Center(child: CircularProgressIndicator(),))
        : HandlingView(
            status: controller.status,
            widget: Scaffold(
              body: Center(
                child: Text(controller.data[0]["name"]),
              ),
            ));
      },
    );
  }
}
