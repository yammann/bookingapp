import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/data-source/static/static.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SpecialTodoListController extends GetxController {
  // void toggleCheckbox(int index);
  // void selectedTodo(String value);
  void deleteItem(String label);
  void addItem(TodoItem todoItem);
  void fetchItem();
  void call(String phoneNumber);
}

class SpecialTodoListControllerImp extends SpecialTodoListController {
  final CollectionReference colectionRef =
      FirebaseFirestore.instance.collection("Special_todo");
  List todoItems = [];

  late TextEditingController labelController;


  @override
  void addItem(TodoItem todoItem) async {
    try {
      await colectionRef.doc(todoItem.label).set(todoItem.toMap());
      labelController.clear();
      fetchItem();
      print("added$todoItem");
    } catch (e) {
      print("has error");
    }
  }

  @override
  void deleteItem(String label) async {
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

  @override
  void call(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
