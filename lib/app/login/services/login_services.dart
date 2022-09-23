import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verification;

  Future<void> login(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verification = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<String> verifyCode(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verification,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(
      credential,
    );
    return _auth.currentUser!.uid;
  }
}
