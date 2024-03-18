
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:get/get.dart';

abstract class UserProfileController extends GetxController {
  
}

class UserProfileControllerImp extends UserProfileController {
 late UserModel userModel;

 @override
  void onInit()async {
    userModel=await getUserData();
    super.onInit();
  }
}
