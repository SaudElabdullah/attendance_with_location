import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<String?> loginWithPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+966555031075',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = 'xxxx';

        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return _auth.currentUser!.uid;
  }
}
