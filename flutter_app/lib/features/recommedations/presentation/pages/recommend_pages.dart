import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';
import 'package:skia_coffee/features/quiz/presentation/pages/quiz_page.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/answer_sending/remote/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/answer_sending/remote/remote_recommendations_state.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_quiz_event.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/recommedations/presentation/pages/recommended_products.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/done_button.dart';
import 'package:skia_coffee/injection_container.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage({Key? key}) : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  int l = 0;

  @override
  Widget build(BuildContext context) {
    buildBody() {
      // return BlocBuilder<RemoteAnswerSendingBloc, RemoteAnswerSendingState>(
      //     builder: (_, state) {
      //   if (state is RemoteAnswerSendingStateLoading) {
      //     return const Center(
      //       child: CupertinoActivityIndicator(color: textColor),
      //     );
      //   }

      //   if (state is RemoteAnswerSendingStateError) {
      //     Get.off(QuizPage());
      //     return const Center(
      //         child: Icon(
      //       Icons.refresh,
      //       color: textColor,
      //     ));
      //   }
      return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40),
                  Image(image: AssetImage(icLogo)),
                  SizedBox(width: 5),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: textColor,
                  ),
                ],
              ),
            ),
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1.0,
            toolbarHeight: 60,
            shadowColor: Colors.white,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Here’s your Recommendations",
                  style: TextStyle(
                    fontFamily: bold,
                    fontSize: 32,
                    color: textColor,
                  ),
                ),
              ),
              BlocProvider<RemoteRecommendationBloc>(
                create: (context) => s1()..add(const GetRecommendations()),
                child: const RecommendedProductsLayout(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DoneButton(),
              ),
            ],
          ));
      // });
    }

    return buildBody();
  }
}
