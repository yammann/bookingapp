import 'package:e_store/core/class/crupde.dart';
import 'package:e_store/core/class/status.dart';
import 'package:get/get.dart';

abstract class FetchUserDataController extends GetxController {
  fetchUserData();
}

class FetchUserDataControllerImp extends FetchUserDataController {
  CrUpDe crUpDe = Get.find();
  late Status status;
  Map<String, dynamic> currentUser = {};

  @override
  fetchUserData() async {
    status = Status.loading;
    var respone = await crUpDe.fetchUserData();
    respone.fold((l) {
      status = l;
    }, (r) {
      currentUser = r;
    });
    print("000000000000000000000000000000${currentUser}");
    print("000000000000000000000000000000${status}");
    if (currentUser.isNotEmpty) {
      status = Status.success;
    } else {
      status = Status.failure;
    }
    update();
  }
  
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }
}

