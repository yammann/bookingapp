import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


exitAlert(){
  Get.defaultDialog(
    title: "Worning",
    content: const Text("Do you need exit the app"),
    confirm: ElevatedButton(onPressed: (){
      exit(0);
    }, child: const Text("Ok")),
    cancel: ElevatedButton(onPressed: (){
      Get.back();
    }, child: const Text("Cancel")),
  );
}