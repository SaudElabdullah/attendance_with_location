import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeServices {
  static void recorde(String recordeName) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DateTime date = DateTime.now();
    String dateNow = '${date.year}-${date.month}-${date.day}';
    FirebaseFirestore.instance.collection("employees_attendance").doc(uid).collection('attendance').doc(dateNow).set(
      {DateTime.now().toString(): recordeName},
      SetOptions(merge: true),
    );
  }
}
