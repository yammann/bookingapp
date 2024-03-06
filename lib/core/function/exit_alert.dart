import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


exitAlert(){
  Get.defaultDialog(
    title: "EAtitle".tr,
    content:  Text("EAtext".tr),
    confirm: ElevatedButton(onPressed: (){
      exit(0);
    }, child:  Text("BTNok".tr)),
    cancel: ElevatedButton(onPressed: (){
      Get.back();
    }, child:  Text("BTNcancel".tr)),
  );
}