import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_quiz_event.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_state.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/coffee_card.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/done_button.dart';
import 'package:skia_coffee/injection_container.dart';

class RecommendPage extends StatelessWidget {
  RecommendPage({Key? key}) : super(key: key);
  int l = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: textColor,
                ),
                Image(image: AssetImage(icLogo)),
                Icon(
                  Icons.shopping_bag_outlined,
                  color: textColor,
                ),
              ],
            ),
          ),
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
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
              child: RecommendPage(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DoneButton(),
            ),
          ],
        ));
  }
}
