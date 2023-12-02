import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:skia_coffee/auth/signUp/presentation/providers/otp_controller.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/constants/icons.dart';
import 'package:skia_coffee/features/quiz/presentation/pages/quiz_page.dart';
import 'package:skia_coffee/auth/signUp/presentation/pages/otp_page.dart';
import 'package:skia_coffee/auth/signUp/presentation/providers/signUp_controller.dart';

//editText
class EditableTextWidget extends StatefulWidget {
  final TextEditingController _controller;

  const EditableTextWidget(this._controller);
  @override
  _EditableTextWidgetState createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  // final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: textColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: widget._controller,
            decoration: const InputDecoration(
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
      ),
    );
  }
}

//button
class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget(
      {super.key, required this.controller, required this.phoneNumber});
  final TextEditingController controller;
  final String phoneNumber;

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  bool loading = false;

  final _auth = FirebaseAuth.instance;
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

//googleLoginButton

class GoogleLoginButton extends StatefulWidget {
  const GoogleLoginButton({super.key});

  @override
  State<GoogleLoginButton> createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  void changeScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const QuizPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: textColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              changeScreen(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  SvgPicture.asset(icGoogle),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text("Sign in with Google"),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

//OTP layout
class OtpLayout extends StatefulWidget {
  const OtpLayout({super.key});

  @override
  State<OtpLayout> createState() => _OtpLayoutState();
}

class _OtpLayoutState extends State<OtpLayout> {
  var otp;
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        // child: Form(
        //     child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       height: 68,
        //       width: 64,
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: textColor,
        //           width: 2,
        //         ),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: TextField(
        //           onChanged: (value) {
        //             if (value.length == 1) {
        //               FocusScope.of(context).nextFocus();
        //               otp += value;
        //               cnt++;
        //               if (cnt == 4) {
        //                 OTPController.instance.verifyOTP(otp);
        //               }
        //             }
        //           },
        //           decoration: const InputDecoration(
        //             border: InputBorder.none, // Remove default border
        //             contentPadding: EdgeInsets.all(12.0),
        //           ),
        //           style: Theme.of(context).textTheme.headlineMedium,
        //           keyboardType: TextInputType.number,
        //           textAlign: TextAlign.center,
        //           inputFormatters: [
        //             LengthLimitingTextInputFormatter(1),
        //             FilteringTextInputFormatter.digitsOnly,
        //           ]),
        //     ),
        //     Container(
        //       height: 68,
        //       width: 64,
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: textColor,
        //           width: 2,
        //         ),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: TextField(
        //           onChanged: (value) {
        //             if (value.length == 1) {
        //               FocusScope.of(context).nextFocus();
        //             }
        //           },
        //           decoration: const InputDecoration(
        //             border: InputBorder.none, // Remove default border
        //             contentPadding: EdgeInsets.all(12.0),
        //           ),
        //           style: Theme.of(context).textTheme.headlineMedium,
        //           keyboardType: TextInputType.number,
        //           textAlign: TextAlign.center,
        //           inputFormatters: [
        //             LengthLimitingTextInputFormatter(1),
        //             FilteringTextInputFormatter.digitsOnly,
        //           ]),
        //     ),
        //     Container(
        //       height: 68,
        //       width: 64,
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: textColor,
        //           width: 2,
        //         ),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: TextFormField(
        //           onChanged: (value) {
        //             otp += value;
        //             if (value.length == 1) {
        //               FocusScope.of(context).nextFocus();
        //             }
        //           },
        //           decoration: const InputDecoration(
        //             border: InputBorder.none, // Remove default border
        //             contentPadding: EdgeInsets.all(12.0),
        //           ),
        //           style: Theme.of(context).textTheme.headlineMedium,
        //           keyboardType: TextInputType.number,
        //           textAlign: TextAlign.center,
        //           inputFormatters: [
        //             LengthLimitingTextInputFormatter(1),
        //             FilteringTextInputFormatter.digitsOnly,
        //           ]),
        //     ),
        //     Container(
        //       height: 68,
        //       width: 64,
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: textColor,
        //           width: 2,
        //         ),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: TextField(
        //           decoration: const InputDecoration(
        //             border: InputBorder.none, // Remove default border
        //             contentPadding: EdgeInsets.all(12.0),
        //           ),
        //           style: Theme.of(context).textTheme.headlineMedium,
        //           keyboardType: TextInputType.number,
        //           textAlign: TextAlign.center,
        //           inputFormatters: [
        //             LengthLimitingTextInputFormatter(1),
        //             FilteringTextInputFormatter.digitsOnly,
        //           ]),
        //     ),
        //   ],
        // )),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PinCodeTextField(
            appContext: context,
            length: 6, // Set the length of the OTP
            onChanged: (value) {
              print(value);
            },
            onCompleted: (value) {
              // Handle the completed OTP input
              Logger logger = Logger();
              logger.i("OTP entered");
              OTPController.instance.verifyOTP(value);
            },
            // Other properties and styling options can be customized as needed
            // Example:
            backgroundColor: Colors.transparent,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              selectedColor: Colors.amber,
              inactiveColor: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
