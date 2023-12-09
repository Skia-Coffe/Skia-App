import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:skia_coffee/auth/login/controllers/login_otp_verify.dart';

import '../../../../core/constants/consts.dart';

class LoginOtpLayout extends StatefulWidget {
  const LoginOtpLayout({super.key});

  @override
  State<LoginOtpLayout> createState() => _LoginOtpLayoutState();
}

class _LoginOtpLayoutState extends State<LoginOtpLayout> {
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
              OTPLoginController.instance.verifyOTP(value);
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
