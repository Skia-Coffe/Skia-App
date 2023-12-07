import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/auth/signUp/presentation/pages/otp_page.dart';
import 'package:skia_coffee/auth/signUp/presentation/providers/signUp_controller.dart';

import '../../../../core/constants/consts.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget(
      {super.key, required this.controller, required this.phoneNumber});
  final TextEditingController controller;
  final String phoneNumber;

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> doesUserExist(String uid) async {
    try {
      // Attempt to retrieve user information
      return true; // User exists
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false; // User does not exist
      }
      throw e;
    }
  }

//
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            setState(() {
              loading = true;
            });
            // try {
            //   Get.to(const OtpVerify(verificationId: "123413"));
            // } catch (error) {
            //   // Handle errors or show a message
            //   print("Error: $error");
            // } finally {
            //   setState(() {
            //     loading = false;
            //   });
            // }
            // changeScreen(context);

            SignUpController.instance
                .phoneAuthentication(widget.phoneNumber.trim());
            Get.to(OtpVerify(phoneNo: widget.phoneNumber));
            // changeScreen(context);
            // _auth.verifyPhoneNumber(
            //   phoneNumber: widget.controller.text.trim(),
            //   verificationCompleted: (credential) async {
            //     await _auth.signInWithCredential(credential);
            //   },
            //   verificationFailed: (e) {
            //     if (e.code == 'invalid-phone-number') {
            //       Get.snackbar('Error', 'Invalid Phone Number');
            //     } else {
            //       Get.snackbar(
            //           'Error', 'Something went wrong, please try again!');
            //     }
            //   },
            //   codeSent: (verificationId, resendToken) {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 OtpVerify(verificationId: verificationId)));
            //   },
            //   codeAutoRetrievalTimeout: (verificationId) {
            //     Get.snackbar('Error', 'Timed out');
            //   },
            // );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Text(
            "Get OTP",
            style: TextStyle(
                fontFamily: regular, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
