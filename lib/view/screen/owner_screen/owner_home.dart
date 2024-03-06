import 'package:e_store/controller/data/fetch_user_data.dart';
import 'package:e_store/core/class/handling_view.dart';
import 'package:e_store/view/screen/owner_screen/widget/owner_home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerHome extends StatelessWidget {
  const OwnerHome({super.key});

  

  @override
  Widget build(BuildContext context) {
    Get.put(FetchUserDataControllerImp());
    
    return GetBuilder<FetchUserDataControllerImp>(
      builder: (FetchUserDataControllerImp controller) {
        return HandlingView(status: controller.status, widget: const OwnerHomeBody());
      },
    );
  }
}
