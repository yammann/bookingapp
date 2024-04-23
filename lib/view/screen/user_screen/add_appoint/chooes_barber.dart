import 'package:e_store/controller/add_appoint/chooes_barber_controler.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/widget/cached_network_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooesBarberView extends StatelessWidget {
  ChooesBarberView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooesBarberControllerImp>(
      init: ChooesBarberControllerImp(),
      builder: (controller) {
        return Column(
          children: [
            const SizedBox(height: 10),
             Text(
              "Chooes Barber".tr,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: controller.barbers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:() {controller.onTapBarber(index);},
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: kOnBoardingBG,
                        border: Border.all(color: kOnBoardingP),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          CachedImag(
                            imgProfile: controller.barbers[index].imgProfile,
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(width: 15),
                          Text(controller.barbers[index].userName!),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
