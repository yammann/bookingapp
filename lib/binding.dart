import 'package:e_store/controller/Auth/signup_controller.dart';
import 'package:e_store/core/class/auth.dart';
import 'package:e_store/core/class/crupde.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
      Get.put(CrUpDe());
      Get.put(Auth());
      Get.lazyPut(()=>SignUpControllerImp(),fenix: true);
  }

}