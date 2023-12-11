import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/auth/login/controllers/login_controller.dart';
import 'package:skia_coffee/auth/login/presentation/pages/login_otp_verify_page.dart';
import 'package:skia_coffee/auth/signUp/presentation/pages/otp_page.dart';
import 'package:skia_coffee/auth/signUp/repository/authentication_repository.dart';

import '../../../../core/constants/consts.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget(
      {super.key,
      required this.controller,
      required this.phoneNumber,
      required this.countryCode});
  final TextEditingController controller;
  final String phoneNumber;
  final String countryCode;

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String fullPhoneNumber = "+91";
  String phoneNumber = "";
  String getPhoneNo() {
    phoneNumber = widget.controller.text;
    String selectedCountryCode = widget.countryCode;
    fullPhoneNumber = '$selectedCountryCode$phoneNumber';
    return fullPhoneNumber;
  }

  init() {
    getPhoneNo();
  }

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
              fullPhoneNumber = getPhoneNo();
            });

            if (await AuthenticationRepository.to
                    .checkUser(phoneNumber.trim()) ==
                true) {
              LoginController.instance
                  .phoneAuthentication(fullPhoneNumber.trim());
              Get.to(LoginOtpVerify(phoneNo: fullPhoneNumber));
            } else {
              Get.snackbar("Oops !", "No such user please signUp");
            }
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
