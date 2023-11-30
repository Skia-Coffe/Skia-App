import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/quiz_provider.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_bloc.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_state.dart';
import 'package:skia_coffee/features/quiz/presentation/widgets/next_button.dart';
import 'package:skia_coffee/features/quiz/presentation/widgets/option_card.dart';
import 'package:skia_coffee/features/quiz/presentation/widgets/widgets.dart';
import 'package:skia_coffee/features/recommedations/presentation/pages/recommend_pages.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  void changeScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RecommendPage()));
  }

  int index = 0;
  int l = -2;
  String btnText = "Next";
  void nextQuestion() {
    if (index == l - 1) {
      changeScreen(context);
      return;
    }

    if (index == l - 2) {
      btnText = "Recommend";
      return;
    }

    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buildBody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteQuizBloc, RemoteQuizState>(
        builder: (_, state) {
          if (state is RemoteQuizStateLoading) {
            logger.i(state.quizzes.toString());
            logger.i("Loading...");
            return const Center(
              child: CupertinoActivityIndicator(color: textColor),
            );
          }

          if (state is RemoteQuizStateError) {
            return const Center(
                child: Icon(
              Icons.refresh,
              color: textColor,
            ));
          }

          l = state.quizzes!.length;
          var questions = state.quizzes!;
          if (l == 1) btnText = "Recommend";

          return Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icBackgoundQuiz),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.help_outline,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                        child: QuestionWidget(
                          question: questions[index].question!,
                          indexAction: index,
                          totalQuestions: questions.length,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                    child: Column(children: [
                      OptionCard(
                          option: questions[index].option1!,
                          id: 1,
                          index: index),
                      OptionCard(
                          option: questions[index].option2!,
                          id: 2,
                          index: index),
                      OptionCard(
                          option: questions[index].option3!,
                          id: 3,
                          index: index),
                      OptionCard(
                          option: questions[index].option4!,
                          id: 4,
                          index: index),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NextButtonQuiz(
                        nextQuestion: nextQuestion, btnText: btnText),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

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
        body: _buildBody());
  }
}
