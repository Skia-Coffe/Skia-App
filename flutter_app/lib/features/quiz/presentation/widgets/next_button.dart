import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';

class NextButtonQuiz extends StatelessWidget {
  const NextButtonQuiz(
      {super.key, required this.nextQuestion, required this.btnText});
  final VoidCallback nextQuestion;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: 282,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            nextQuestion();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            btnText,
            style: const TextStyle(
                fontFamily: bold, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
