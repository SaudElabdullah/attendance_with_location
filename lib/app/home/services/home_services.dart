import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class HomeServices {
  static void recorde(String recordeName) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DateTime date = DateTime.now();
    String dateNow = DateFormat.yMMMMd().format(date);
    FirebaseFirestore.instance.collection("employees_attendance").doc(uid).collection('attendance').doc(dateNow).set(
      {DateFormat.yMMMd().add_jm().format(DateTime.now()).toString(): recordeName},
      SetOptions(merge: true),
    );
  }
}
