import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_bloc.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_state.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/coffee_card.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/done_button.dart';

class RecommendPage extends StatelessWidget {
  RecommendPage({Key? key}) : super(key: key);
  int l = 0;
  @override
  Widget build(BuildContext context) {
    buildbody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteRecommendationBloc, RemoteRecommendationState>(
          builder: (_, state) {
        if (state is RemoteRecommendationStateLoading) {
          logger.i(state.recommendations.toString());
          logger.i("Loading...");
          return const Center(
            child: CupertinoActivityIndicator(color: textColor),
          );
        }

        if (state is RemoteRecommendationStateError) {
          return const Center(
              child: Icon(
            Icons.refresh,
            color: textColor,
          ));
        }

        l = state.recommendations!.length;
        var products = state.recommendations!;
        return Column(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set the number of columns
                    crossAxisSpacing: 8.0, // Set the spacing between columns
                    mainAxisSpacing: 0.0, // Set the spacing between rows
                    childAspectRatio:
                        0.55, // Adjust this value to set the size of each grid element
                  ),
                  itemCount: l, // Set the number of entries
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CoffeeCard(
                            name: products[index].name!,
                            price: products[index].price!),
                        const AddToCartButton(),
                      ],
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DoneButton(),
            ),
          ],
        );
      });
    }

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
        body: buildbody());
  }
}
