import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class AuthenticationRepository {
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'Invalid Phone Number');
          } else {
            Get.snackbar('Error', 'Something went wrong try again!');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }
}
