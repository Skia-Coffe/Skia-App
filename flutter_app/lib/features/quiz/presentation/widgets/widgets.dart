import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_bloc.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_event.dart';
import 'package:skia_coffee/features/quiz/presentation/pages/questions_page.dart';
import 'package:skia_coffee/features/skeleton/bottom_navigation.dart';
import 'package:skia_coffee/injection_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(icLogo),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ElevatedButtonWidgetQuiz extends StatefulWidget {
  const ElevatedButtonWidgetQuiz({super.key});

  @override
  State<ElevatedButtonWidgetQuiz> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidgetQuiz> {
  void changeScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            // builder: (context) => ChangeNotifierProvider(
            //     create: (context) => QuizProvider(),
            //     child: const QuestionPage())));
            builder: (context) => BlocProvider<RemoteQuizBloc>(
                create: (context) => s1()..add(const GetQuizzes()),
                child: const QuestionPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: 280,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            changeScreen(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Text(
            "Take the quiz",
            style:
                TextStyle(fontFamily: bold, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BorderedButton extends StatefulWidget {
  const BorderedButton({super.key});

  @override
  State<BorderedButton> createState() => _BorderedButtonState();
}

class _BorderedButtonState extends State<BorderedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextButton(
          onPressed: () {
            Get.to(const BottomNavigation(curHome: 0));
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: textColor, width: 1),
              )),
          child: const Text(
            "Skip",
            style: TextStyle(fontFamily: bold, fontSize: 14, color: textColor),
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions});

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        question,
        style: const TextStyle(
          fontFamily: bold,
          fontSize: 32,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
