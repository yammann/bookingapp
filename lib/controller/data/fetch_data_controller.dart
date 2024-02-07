import 'package:e_store/core/class/crupde.dart';
import 'package:e_store/core/class/status.dart';
import 'package:get/get.dart';

abstract class FetchDataController extends GetxController {
  fetchData();
}

class FetchDataControllerImp extends FetchDataController {
  CrUpDe crUpDe = Get.find();
  List<Map<String, dynamic>> data = [];
   late Status status;
  
  @override
  fetchData() async {
    status = Status.loading;
    var respone = await crUpDe.fetchData("users");
    respone.fold((l){status = l;},(r){data = r;});
    if (data.isNotEmpty) {
      status = Status.success;
    }else{
      status=Status.failure;
    }
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
