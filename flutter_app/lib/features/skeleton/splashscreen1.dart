import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/auth/login/presentation/pages/login_page.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/skeleton/splashscreen2.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  void changeScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SplashScreen2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarbg,
          toolbarHeight: 5,
        ),
        body: Container(
          width: double.infinity,
          alignment: Alignment.bottomRight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/Subtract1.png"), // Replace with your image asset
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                        16, 50, 16, 16), // Adjust the padding as needed
                    child: SizedBox(
                        width: 48,
                        height: 32,
                        child: Image(
                            image: AssetImage(icLogo), fit: BoxFit.cover)),
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
                            "It all begins at the\nfarms!",
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
