import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/quiz/presentation/widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(icLogo),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 1.0,
        toolbarHeight: 60,
        shadowColor: Colors.white,
      ),
      body: Center(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(icBackgoundQuiz), fit: BoxFit.fill),
        ),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 26, 40, 16),
                child: Column(
                  children: [
                    Text(
                      "Personalize Brew with the Quiz",
                      style: TextStyle(
                        fontFamily: bold,
                        fontSize: 32,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your pathway to coffee perfection tailored just for you!",
                      style: TextStyle(
                        fontFamily: bold,
                        fontSize: 14,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 16),
                child: Column(
                  children: [
                    Text(
                      "Take our fun and interactive quiz to discover your coffee personality. We'll unveil the ideal roast, grind, and brewing method that aligns with your taste preferences. Whether you're a light roast lover with a pour-over passion or a dark roast aficionado who adores espresso, we've got your perfect brew covered. Elevate your coffee game with a personalized touch. Try the quiz today and unlock a coffee experience like no other!",
                      style: TextStyle(
                          fontFamily: regular,
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
                      child: ElevatedButtonWidgetQuiz(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 2),
                      child: BorderedButton(),
                    ),
                  ],
                ),
              )
            ]),
      )),
    );
  }
}
