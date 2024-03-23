import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/model/apointment-model.dart';

@override
  appointmentIfExceed(String documentId) async {
    DateTime currentTime = DateTime.now();

    DocumentReference appointCollection =FirebaseFirestore.instance.collection("apointment").doc(documentId);

    Stream<DocumentSnapshot<Object?>> appointQuerySnapshot =appointCollection.snapshots();

    appointQuerySnapshot.listen(
      (DocumentSnapshot snapshot) {
          Stream<QuerySnapshot<Map<String, dynamic>>> subDocumentSnapshott = snapshot
              .reference
              .collection("time")
              .snapshots();

          subDocumentSnapshott.listen(
            (QuerySnapshot snapshot) {
              for (QueryDocumentSnapshot document in snapshot.docs) {
                AppointmentModel appointmentModel = AppointmentModel.fromJson(
                    document.data() as Map<String, dynamic>);

                String dateString ='${appointmentModel.date} ${appointmentModel.time.substring(0, 5)}:00';
                print(dateString);
                DateTime dateTime = DateTime.parse(dateString);
                print(dateTime);

                if (currentTime.isAfter(dateTime)) {
                  document.reference.update({
                    "appointmentExceed": true,
                  });
                }
                else{
                   document.reference.update({
                    "appointmentExceed": false,
                  });
                }
              }
            },
          );
      },
    );
   
  }