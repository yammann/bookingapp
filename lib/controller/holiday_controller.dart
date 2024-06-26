import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/function/check_if_snackbar_is_active.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class HolidayController extends GetxController {
  void toggleCheckbox(int index);
  void selectedTodo(int index);
  void confirme();
  fetchHoliday();
}

class HolidayControllerImp extends HolidayController {
  List<dynamic> selectedTodoList = [];

  List<TodoItem> holidays = [
    TodoItem(label: "Monday"),
    TodoItem(label: "Tuesday"),
    TodoItem(label: "Wednesday"),
    TodoItem(label: "Thursday"),
    TodoItem(label: "Friday"),
    TodoItem(label: "Saturday"),
    TodoItem(label: "Sunday"),
  ];

  final User currentUser = FirebaseAuth.instance.currentUser!;

  late UserModel userModel;

  @override
  void toggleCheckbox(int index) {
    holidays[index].isSelected = !holidays[index].isSelected;
    update();
  }

  @override
  void selectedTodo(int index) {
    if (!selectedTodoList.contains(index+1)) {
      selectedTodoList.add(index+1);
    } else {
      selectedTodoList.remove(index+1);
    }
    update();
  }

  @override
  void onInit() async {
    userModel = await getUserData(currentUser.uid);
    fetchHoliday();
    super.onInit();
  }

  @override
  void confirme() async {
    try {
      await FirebaseFirestore.instance
          .collection("barber")
          .doc(currentUser.uid)
          .update({"holidays": selectedTodoList});

      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.uid)
          .update({"holidays": selectedTodoList});
          isActiveSnackbar();
          Get.snackbar("Alert".tr, "Success".tr,backgroundColor: kSuccessSnackbar);
          Get.offAllNamed("/");
    } catch (e) {
      isActiveSnackbar();
      Get.snackbar("Alert".tr, "blockinError".tr,backgroundColor: kWorrningSnackbar);
    }
  }
  
  @override
  fetchHoliday() {
     for(int holiday in userModel.holidays!){
      holidays[holiday-1].isSelected=true;
      selectedTodoList.add(holiday);
      update();
     }
  }
}
