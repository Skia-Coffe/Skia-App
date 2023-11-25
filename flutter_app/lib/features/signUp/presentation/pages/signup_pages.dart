import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/signUp/presentation/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(icBackground), fit: BoxFit.cover)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                child: Image.asset(icLogo),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enter phone number",
                          style: TextStyle(
                              fontFamily: bold,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                      ],
                    ),
                  ),
                  EditableTextWidget(),
                  const ElevatedButtonWidget(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontFamily: regular,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const GoogleLoginButton()
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
                      color: textColor),
                ),
              ),
            ]),
      ),
    );
  }
}
