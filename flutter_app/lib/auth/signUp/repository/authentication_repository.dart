import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/auth/login/presentation/pages/login_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get to => Get.find();
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  Logger logger = Logger();

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'Invalid Phone Number');
            Get.to(const LoginPage());
          } else {
            Get.snackbar('Error', e.toString());
            logger.i(e.toString());
            Get.to(() => const LoginPage());
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } catch (e) {
      print('Error during phone authentication: $e');
      // Handle the error as needed
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId.value,
          smsCode: otp,
        ),
      );
      return credentials.user != null;
    } catch (e) {
      Get.snackbar('Error during OTP verification:', e.toString());
      return false;
      // Handle the error as needed
    }
  }
}
