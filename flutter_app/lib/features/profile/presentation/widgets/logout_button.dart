import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/features/skeleton/splashscreen1.dart';

import '../../../../core/constants/consts.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: SizedBox(
        height: 50,
        child: TextButton(
          onPressed: () {
            _auth.signOut();
            Get.offAll(SplashScreen1());
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: textColor, width: 1),
              )),
          child: const Text(
            "Log Out",
            style: TextStyle(
                fontFamily: regular,
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
