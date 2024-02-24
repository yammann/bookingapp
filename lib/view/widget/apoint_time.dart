import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApointTime extends StatelessWidget {
  ApointTime({super.key, required this.dataList});
  final List<dynamic> dataList;
  final CalenderControllerImp calenderControllerImp=Get.put(CalenderControllerImp());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              calenderControllerImp.changeSelectedTime(index);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:dataList[index].state? calenderControllerImp.selectedTime==index?kOnBoardingP: kOnBoardingBG:Colors.grey,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(
                child: Text(dataList[index].time!),
              ),
            ),
          );
        },
      ),
    );
  }
}
