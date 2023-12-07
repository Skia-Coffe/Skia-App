import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/auth/login/presentation/pages/login_page.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/skeleton/splashscreen3.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  void changeScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SplashScreen3()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarbg,
          toolbarHeight: 5,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/Subtract2.png"), // Replace with your image asset
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        16, 50, 16, 16), // Adjust the padding as needed
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        16, 50, 16, 16), // Adjust the padding as needed
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(const LoginPage());
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4D2212),
                            fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset("assets/images/title.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(
                              16.0), // Adjust the padding as needed
                          child: Text(
                            "Customize the blend\naccording to your choice.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4D2212),
                                fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            changeScreen(context);
                            print("button clicked");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              'assets/icons/right_arrow.svg',
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                padding: const EdgeInsets.all(30.0),
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
