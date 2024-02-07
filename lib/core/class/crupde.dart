import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_store/core/class/status.dart';
import 'package:e_store/core/function/check_internet.dart';

class CrUpDe {
  Future<Either<Status, List<Map<String, dynamic>>>> fetchData(
      String collection,) async {
         List<Map<String, dynamic>> dataList=[];
    if (await checkInternet()) {
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance.collection(collection).get();

        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in querySnapshot.docs) {
          dataList.add(doc.data());
        }

        return right(dataList);
      } catch (e) {
        print('Error fetching data: $e');
        return left(Status.serverFailure);
      }
    } else {
      return left(Status.offLineFailure);
    }
  }
}
