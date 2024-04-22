import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/apointment-model.dart';

@override
Future<void> appointmentIfExceed(String documentId) async {
  DateTime currentTime = DateTime.now();

  QuerySnapshot barberDocumentSnapshot =
      await FirebaseFirestore.instance.collection("barber").get();

  for (QueryDocumentSnapshot barberdocument in barberDocumentSnapshot.docs) {
    QuerySnapshot appointDocumentSnapshot =
        await barberdocument.reference.collection("apointment").get();
        
    for (QueryDocumentSnapshot appointDocument
        in appointDocumentSnapshot.docs) {
      QuerySnapshot timeDocumentSnapshot = await appointDocument.reference
          .collection("time")
          .where("appointmentExceed", isEqualTo: false)
          .get();
      for (QueryDocumentSnapshot timeDocument in timeDocumentSnapshot.docs) {
        AppointmentModel appointmentModel =
            AppointmentModel.fromJson(timeDocument.data() as Map<String, dynamic>);

        String dateString =
            '${appointmentModel.date} ${appointmentModel.time.substring(0, 5)}:00';
        print(dateString);
        DateTime dateTime = DateTime.parse(dateString);
        print(dateTime);

        if (currentTime.isAfter(dateTime)) {
          await timeDocument.reference.update({
            "appointmentExceed": true,
          });
        } else {
          await timeDocument.reference.update({
            "appointmentExceed": false,
          });
        }
      }
    }
  }
}

  // appointmentIfExceed(String documentId) async {
  //   DateTime currentTime = DateTime.now();

  //   DocumentReference appointCollection =FirebaseFirestore.instance.collection("apointment").doc(documentId);

  //   Stream<DocumentSnapshot<Object?>> appointQuerySnapshot =appointCollection.snapshots();

  //   appointQuerySnapshot.listen(
  //     (DocumentSnapshot snapshot) {
  //         Stream<QuerySnapshot<Map<String, dynamic>>> subDocumentSnapshott = snapshot
  //             .reference
  //             .collection("time")
  //             .snapshots();

  //         subDocumentSnapshott.listen(
  //           (QuerySnapshot snapshot) {
  //             for (QueryDocumentSnapshot document in snapshot.docs) {
  //               AppointmentModel appointmentModel = AppointmentModel.fromJson(
  //                   document.data() as Map<String, dynamic>);

  //               String dateString ='${appointmentModel.date} ${appointmentModel.time.substring(0, 5)}:00';
  //               print(dateString);
  //               DateTime dateTime = DateTime.parse(dateString);
  //               print(dateTime);

  //               if (currentTime.isAfter(dateTime)) {
  //                 document.reference.update({
  //                   "appointmentExceed": true,
  //                 });
  //               }
  //               else{
  //                  document.reference.update({
  //                   "appointmentExceed": false,
  //                 });
  //               }
  //             }
  //           },
  //         );
  //     },
  //   );
   
  // }