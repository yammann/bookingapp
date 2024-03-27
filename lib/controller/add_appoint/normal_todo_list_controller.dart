import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NormalTodoListController extends GetxController {
  void toggleCheckbox(int index);
  void selectedTodo(TodoItem todoItem);
  void deleteItem(String label);
  void addItem(TodoItem todoItem);
  void fetchItem();
  navToCalender();
}

class NormalTodoListControllerImp extends NormalTodoListController {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("todo");
  List<TodoItem> selectedTodoList = [];

  List<TodoItem> todoItems = [];

  final User currentUser=FirebaseAuth.instance.currentUser!;

  late UserModel userModel;

  late TextEditingController labelController;
  late TextEditingController timeController;

  @override
  void toggleCheckbox(int index) {
    todoItems[index].isSelected = !todoItems[index].isSelected;
    update();
  }

  @override
  void selectedTodo(TodoItem todoItem) {
    if (!selectedTodoList.contains(todoItem)) {
      selectedTodoList.add(todoItem);
    } else {
      selectedTodoList.remove(todoItem);
    }
    update();
  }

  @override
  void addItem(TodoItem todoItem) async {
    if (timeController.text.isNotEmpty&&labelController.text.isNotEmpty) {
  try {
    await collectionRef.doc(todoItem.label).set(todoItem.toMap());
    fetchItem();

  } catch (e) {
     Get.snackbar( "Warning".tr, "error".tr);
  }
}
  }

  @override
  void deleteItem(String label) async {
    try {
      await collectionRef.doc(label).delete();
      fetchItem();

    } catch (e) {
       Get.snackbar( "Warning".tr, "error".tr);
    }
  }

  @override
  void onInit() async{
    userModel = await getUserData(currentUser.uid);
    labelController = TextEditingController();
    timeController = TextEditingController();
    fetchItem();
    super.onInit();
  }

  @override
  void fetchItem() async {
    List<TodoItem> forImplement = [];
    try {
      QuerySnapshot itemQuerySnapshot = await collectionRef.get();

      for (var itemDocumentSnapshot in itemQuerySnapshot.docs) {
        TodoItem todoItem = TodoItem.fromJson(
            itemDocumentSnapshot.data() as Map<String, dynamic>);
        forImplement.add(todoItem);
      }
      todoItems = forImplement;

      update();
    } catch (_) {
       Get.snackbar( "Warning".tr, "error".tr);
    }
  }

  @override
  void dispose() {
    timeController.dispose();
    labelController.dispose();
    super.dispose();
  }

  @override
  navToCalender() {
    if (selectedTodoList.isEmpty) {
      Get.snackbar("Warning".tr, "chooseAtLeastOne".tr,
          backgroundColor:kWorrningSnackbar);
    } else {
       Get.toNamed(
        AppRoute.calendarPage,
        arguments: {
        'selectedTodoList': selectedTodoList,
        "userModel":userModel,},);
    }
  }
}
