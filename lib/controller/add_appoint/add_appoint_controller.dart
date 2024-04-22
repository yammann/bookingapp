
import 'package:get/get.dart';

abstract class AddAppointController extends GetxController {
  currentPage(int v);
}

class AddAppointControllerImp extends AddAppointController {
  int currentIndex = 0;

  
  @override
  currentPage(int v) {
    currentIndex = v;
    update();
  }
}
