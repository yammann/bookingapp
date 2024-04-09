import 'package:get/get.dart';

isActiveSnackbar(){
  if(Get.isSnackbarOpen){
    Get.back();
  }
}