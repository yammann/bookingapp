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

// import 'package:e_store/core/class/crupde.dart';
// import 'package:e_store/core/class/status.dart';
// import 'package:e_store/data/model/usermodel.dart';
// import 'package:get/get.dart';

// abstract class FetchDataController extends GetxController {
//   Future<void> fetchAllData();
//   Future<void> fetchUserData();
// }

// class FetchDataControllerImp extends FetchDataController {
//   final CrUpDe crUpDe = Get.find();
//   List<Map<String, dynamic>> data = [];
//   late Status status;
//   Map<String,dynamic> currentUser={} ;

//   @override
//   Future<void> fetchAllData() async {
//     try {
//       status = Status.loading;
//       var response = await crUpDe.fetchAllData("users");
//       response.fold(
//         (error) => status = error,
//         (result) {
//           data = result;
//           status = data.isNotEmpty ? Status.success : Status.failure;
//         },
//       );
      
//     } catch (e) {
//       print('Error fetching all data: $e');
//       status = Status.failure;
//     } finally {
//       update();
//     }
//   }

//   @override
//   void onInit() {
//     fetchAllData();
//     fetchUserData();
//     super.onInit();
//   }

//   @override
//   Future<void> fetchUserData() async {
//     try {
//       status = Status.loading;
//       var response = await crUpDe.fetchUserData();
//       response.fold(
//         (error) => status = error,
//         (result) {
//           currentUser = result;
//           status = currentUser.isNotEmpty ? Status.success : Status.failure;
//         },
//       );
//       print(currentUser);
//     } catch (e) {
//       print('Error fetching user data: $e');
//       status = Status.failure;
//     } finally {
//       update();
//     }
//   }
// }
