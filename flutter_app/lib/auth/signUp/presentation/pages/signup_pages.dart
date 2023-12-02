import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/auth/signUp/presentation/providers/signUp_controller.dart';
import 'package:skia_coffee/auth/signUp/repository/authentication_repository.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/auth/signUp/presentation/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final controller = Get.put(SignUpController());
  final repo = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(icBackground), fit: BoxFit.cover)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: Image.asset(icLogo),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "SignUp",
                            style: TextStyle(
                                fontFamily: bold,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: textColor),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Full Name",
                            style: TextStyle(
                                fontFamily: bold,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: textColor),
                          ),
                        ],
                      ),
                    ),
                    EditableTextWidget(controller.name),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter phone number",
                            style: TextStyle(
                                fontFamily: bold,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: textColor),
                          ),
                        ],
                      ),
                    ),
                    EditableTextWidget(controller.phoneNo),

                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "Or",
                    //     style: TextStyle(
                    //       fontFamily: regular,
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    // const GoogleLoginButton(),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Existing User - ",
                            style: TextStyle(
                                fontFamily: regular,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: textLightColor),
                          ),
                          Text(
                            "Log IN",
                            style: TextStyle(
                                fontFamily: bold,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     titleName,
                //     style: GoogleFonts.dosis(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //         fontStyle: FontStyle.normal,
                //         color: textColor),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButtonWidget(controller: controller.phoneNo),
                ),
              ]),
        ),
      ),
    );
  }
}
