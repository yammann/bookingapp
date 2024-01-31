import 'package:e_store/controller/Auth/signup_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
   
      Get.lazyPut(()=>SignUpControllerImp(),fenix: true);
  }

}