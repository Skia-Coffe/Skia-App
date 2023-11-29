import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
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
  void nextQuestion() {
    if (index == l) {
      changeScreen(context);
      return;
    }
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var quizProvider = Provider.of<QuizProvider>(context);

    // quizProvider.addQuestion(Question(
    //   id: '1',
    //   options: ['Fruity', 'Nutty', 'Chocolatey'],
    //   title: "What flavor profile do you prefer?",
    // ));
    // quizProvider.addQuestion(Question(
    //   id: '1',
    //   options: ['Light', 'Medium', 'Dark'],
    //   title: "What is your roast preferences?",
    // ));
    // quizProvider.addQuestion(Question(
    //   id: '1',
    //   options: ['French press', 'Pour-over', 'Drip', 'Espresso'],
    //   title: "What is your brewing method?",
    // ));
    // quizProvider.addQuestion(Question(
    //   id: '1',
    //   options: ['Mild', 'Moderate', 'Real caffeine punch'],
    //   title: "How strong do you like your coffee?",
    // ));
    // quizProvider.addQuestion(Question(
    //   id: '1',
    //   options: ['Vanilla', 'Vanilla', 'Vanilla', 'None'],
    //   title: "What additional flavors do you like?",
    // ));

    // l = quizProvider.questions.length;
    _buildBody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteQuizBloc, RemoteQuizState>(
        builder: (_, state) {
          if (state is RemoteQuizStateLoading) {
            logger.i(state.quizzes.toString());
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
                      OptionCard(option: questions[index].option1!),
                      OptionCard(option: questions[index].option2!),
                      OptionCard(option: questions[index].option3!),
                      OptionCard(option: questions[index].option4!),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NextButtonQuiz(nextQuestion: nextQuestion),
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
