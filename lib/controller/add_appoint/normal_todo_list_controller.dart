import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NormalTodoListController extends GetxController {
  void toggleCheckbox(int index);
  void selectedTodo(String value);
  void deleteItem(String label);
  void addItem(TodoItem todoItem);
  void fetchItem();
}

class NormalTodoListControllerImp extends NormalTodoListController {
  final CollectionReference colectionRef =
      FirebaseFirestore.instance.collection("todo");
  List todoList = [];
  List todoItems = [];

  late TextEditingController labelController;

  @override
  void toggleCheckbox(int index) {
    todoItems[index].isSelected = !todoItems[index].isSelected;
    update();
  }

  @override
  void selectedTodo(String value) {
    if (!todoList.contains(value)) {
      todoList.add(value);
      print(' exists in the list.........$todoList');
    } else {
      todoList.remove(value);
      print(' does not exist in the list or the list is null......$todoList');
    }
    update();
  }

  @override
  void addItem(TodoItem todoItem) async {
    try {
      await colectionRef.doc(todoItem.label).set(todoItem.toMap());
      fetchItem();
      print("added$todoItem");
    } catch (e) {
      print("has error");
    }
  }

  @override
  void deleteItem(String label) async{
    try {
      await colectionRef.doc(label).delete();
      fetchItem();
      print("deleted");
    } catch (e) {
      print("has error delete");
    }
  }

  @override
  void onInit() {
    labelController = TextEditingController();
    fetchItem();
    super.onInit();
  }

  @override
  void fetchItem() async {
    List<TodoItem> forImplement = [];
    try {
      QuerySnapshot itemQuerySnapshot = await colectionRef.get();

      for (var itemDocumentSnapshot in itemQuerySnapshot.docs) {
        TodoItem todoItem = TodoItem.fromJson(
            itemDocumentSnapshot.data() as Map<String, dynamic>);
        forImplement.add(todoItem);
      }
      todoItems = forImplement;
      print(todoItems);
      update();
    } catch (_) {
      print("has error 2");
    }
  }
}
