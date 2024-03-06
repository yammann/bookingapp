 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserModel> getUserData()async{
    DocumentSnapshot<Map<String,dynamic>> snap=await FirebaseFirestore.instance.collection("users")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get();
    
    return UserModel.fromJson(snap.data()!);
  }