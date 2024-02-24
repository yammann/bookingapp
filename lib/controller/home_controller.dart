
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  currentPage(int v);
}

class HomeControllerImp extends HomeController {
  int currentIndex = 0;

  
  @override
  currentPage(int v) {
    currentIndex = v;
    update();
  }
}
