import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/function/get_user_data.dart';
import 'package:e_store/data/model/todo_item.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SpecialTodoListController extends GetxController {
 
  void deleteItem(String label);
  void addItem(TodoItem todoItem);
  void fetchItem();
  void call(String phoneNumber);
  navToCalender();
  getUsers();
  onSelectOfDropdownList(UserModel userModel);
}

class SpecialTodoListControllerImp extends SpecialTodoListController {
  final CollectionReference colectionRef =FirebaseFirestore.instance.collection("Special_todo");
  List todoItems = [];
  final User currentUser=FirebaseAuth.instance.currentUser!;
  List<UserModel>users=[];
  String title="Select Costumer";
  late UserModel costumer;

  late TextEditingController labelController = TextEditingController();
  late TextEditingController durationController= TextEditingController();
  late TextEditingController detailController= TextEditingController();


  @override
  void addItem(TodoItem todoItem) async {
    try {
      await colectionRef.doc(todoItem.label).set(todoItem.toMap());
      labelController.clear();
      fetchItem();
    } catch (e) {
      Get.snackbar( "Warning".tr, "error".tr);
    }
  }

  @override
  void deleteItem(String label) async {
    try {
      await colectionRef.doc(label).delete();
      fetchItem();
    } catch (e) {
      Get.snackbar( "Warning".tr, "error".tr);
    }
  }

  @override
  void onInit() async{
    costumer=await getUserData(currentUser.uid);
    getUsers();
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
      
      update();
    } catch (_) {
      Get.snackbar( "Warning".tr, "error".tr);
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

  @override
  navToCalender() {
    if (detailController.text.isNotEmpty&&durationController.text.isNotEmpty) {
    List<TodoItem> todoItem=[TodoItem(label: detailController.text, time: int.parse(durationController.text))];
      Get.toNamed(
        AppRoute.calendarPage,
        arguments: {'selectedTodoList': todoItem,'userModel':costumer},);
    } else {
       Get.snackbar("Warrning", "Cant entre empty value",
          backgroundColor:kWorrningSnackbar);
    }
  }
  
  @override
  getUsers() async{
    try {
      QuerySnapshot usersQuerySnapshot=await FirebaseFirestore.instance.collection("users").get();
      for(DocumentSnapshot usersDocumentSnapshot in usersQuerySnapshot.docs){
        UserModel userModel=UserModel.fromJson(usersDocumentSnapshot.data() as Map<String,dynamic>);
        users.add(userModel);
      }
      update();
    } catch (e) {
      Get.snackbar("warrning", "has error");
    }
  }
  
  @override
  onSelectOfDropdownList(UserModel userModel) {
   title=userModel.userName!;
   costumer=userModel;
   update();
  }
}
