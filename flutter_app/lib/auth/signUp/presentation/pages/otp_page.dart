import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skia_coffee/auth/login/presentation/pages/login_page.dart';
import 'package:skia_coffee/auth/signUp/presentation/controllers/otp_controller.dart';
import 'package:skia_coffee/auth/signUp/presentation/controllers/signUp_controller.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';
import 'package:skia_coffee/core/constants/texts.dart';
import 'package:skia_coffee/auth/signUp/presentation/widgets/widgets.dart';

class OtpVerify extends StatefulWidget {
  final String phoneNo;
  OtpVerify({super.key, required this.phoneNo});
  final controller = Get.put(OTPController());

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  int _otpTimer = 60; // Set the initial timer duration in seconds
  late Timer _timer;
  bool _timerActive = false;

  @override
  void initState() {
    super.initState();
    // Initialize the timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpTimer > 0) {
          _otpTimer--;
        } else {
          _timer.cancel(); // Cancel the timer when it reaches 0
          _timerActive = false;
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    // Start the timer if not already active
    if (!_timerActive) {
      _otpTimer = 60; // Reset the timer duration
      _timerActive = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_otpTimer > 0) {
            _otpTimer--;
          } else {
            timer.cancel(); // Cancel the timer when it reaches 0
            _timerActive = false;
          }
        });
      });
    }
  }

  Future<void> resendM() async {
    _otpTimer = 60; //_start - 1;
    setState(() {
      startTimer();
    });
    textWidgetInfo();

    // Enter hare your API Code to resend the OTP on your Mobile number.
    SignUpController.instance.phoneAuthentication(widget.phoneNo);
  }

  Widget textWidgetInfo() {
    if (_otpTimer > 0) {
      return Text(
        "Resend in $_otpTimer sec",
        style: GoogleFonts.rubik(
          fontSize: 14,
          color: textColor,
        ),
      );
    } else {
      return InkWell(
        child: Text(
          "Resend", //
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        onTap: () {
          startTimer();
          resendM();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(icBackground), fit: BoxFit.cover)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
                child: SizedBox(
                    width: 48,
                    height: 32,
                    child: Image(image: AssetImage(icLogo), fit: BoxFit.cover)),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enter OTP",
                          style: TextStyle(
                              fontFamily: bold,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enter the OTP sent to your number",
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.phoneNo,
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.black45,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Change",
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const OtpLayout(),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Resend OTP  1:07",
                  //     style: GoogleFonts.rubik(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500,
                  //       fontStyle: FontStyle.normal,
                  //       color: Colors.black26,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textWidgetInfo(),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  titleName,
                  style: GoogleFonts.dosis(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: textColor,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
