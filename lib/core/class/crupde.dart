import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_store/core/class/status.dart';
import 'package:e_store/core/function/check_internet.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrUpDe {
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<Status, List<Map<String, dynamic>>>> fetchAllData(
    String collection,
  ) async {
    List<Map<String, dynamic>> dataList = [];
    if (await checkInternet()) {
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance.collection(collection).get();

        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in querySnapshot.docs) {
          dataList.add(doc.data());
        }
        print(dataList);
        return right(dataList);
      } catch (e) {
        print('Error fetching data: $e');
        return left(Status.serverFailure);
      }
    } else {
      return left(Status.offLineFailure);
    }
  }

  Future<Either<Status, Map<String, dynamic>>> fetchUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    try {
      // Specify the path to the user's document in Firestore
      String uid = user?.uid ?? '';
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('users').doc(uid).get();

      // Check if the document exists
      if (snapshot.exists) {
        // Return user data
        return right(snapshot.data()!);
      } else {
        print('User document does not exist.');
        return left(Status.failure);
      }
    } catch (e) {
      print('Error retrieving user data: $e');
      return left(Status.serverFailure);
    }
    //   try {
    //     DocumentSnapshot<Map<String, dynamic>> snapshot =
    //         await FirebaseFirestore
    //             .instance
    //             .collection("users")
    //             .doc(FirebaseAuth.instance.currentUser!.uid)
    //             .get();
    //       return right(snapshot.data()!);
    //   } catch (e) {
    //     print('Error fetching data: $e');
    //     return left(Status.serverFailure);
    //   }
    // }
  }
// FirebaseAuth auth = FirebaseAuth.instance;
// User? user = auth.currentUser;
//   try {
//     // Specify the path to the user's document in Firestore
//     String uid = user?.uid ?? '';
//     DocumentSnapshot<Map<String, dynamic>> snapshot =
//         await firestore.collection('users').doc(uid).get();

//     // Check if the document exists
//     if (snapshot.exists) {
//       // Return user data
//       return snapshot.data();
//     } else {
//       print('User document does not exist.');
//       return null;
//     }
//   } catch (e) {
//     print('Error retrieving user data: $e');
//     return null;
//   }
}
