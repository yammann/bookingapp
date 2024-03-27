import 'package:e_store/core/class/crupde.dart';
import 'package:e_store/core/class/status.dart';
import 'package:get/get.dart';

abstract class FetchDataController extends GetxController {
  fetchAllData();
  fetchUserData();
}

class FetchDataControllerImp extends FetchDataController {
  CrUpDe crUpDe = Get.find();
  List<Map<String, dynamic>> data = [];
  late Status status;
  Map<String, dynamic> currentUser = {};

  @override
  fetchAllData() async {
    status = Status.loading;
    var respone = await crUpDe.fetchAllData("users");
    respone.fold((l) {
      status = l;
    }, (r) {
      data = r;
    });
    if (data.isNotEmpty) {
      status = Status.success;
    } else {
      status = Status.failure;
    }
    update();
  }

  @override
  void onInit() {
    fetchAllData();
    fetchUserData();
    super.onInit();
  }

  @override
  fetchUserData() async {
    status = Status.loading;
    var respone = await crUpDe.fetchUserData();
    respone.fold((l) {
      status = l;
    }, (r) {
      currentUser = r;
    });
    if (currentUser.isNotEmpty) {
      status = Status.success;
    } else {
      status = Status.failure;
    }
    update();
  }
}

