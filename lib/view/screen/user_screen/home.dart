import 'package:e_store/controller/data/fetch_user_data.dart';
import 'package:e_store/core/class/handling_view.dart';
import 'package:e_store/view/screen/user_screen/widget/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FetchUserDataControllerImp());
    return GetBuilder<FetchUserDataControllerImp>(
      builder: (FetchUserDataControllerImp controller) {
        return HandlingView(
            status: controller.status, widget: const HomeBody());
      },
    );
  }
}


