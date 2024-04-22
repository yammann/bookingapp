 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/usermodel.dart';

Future<UserModel> getUserData(String userId)async{
    DocumentSnapshot<Map<String,dynamic>> snap=await FirebaseFirestore.instance.collection("users")
    .doc(userId)
    .get();
    
    return UserModel.fromJson(snap.data()!);
  }