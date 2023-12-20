import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/features/home/presentation/bloc/your_special_products_bloc/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/home/presentation/bloc/your_special_products_bloc/remote_recommendations_state.dart';
import 'package:skia_coffee/features/home/presentation/widgets/coffee_card_item.dart';

class YourSpecialProductsHome extends StatefulWidget {
  const YourSpecialProductsHome({super.key});

  @override
  State<YourSpecialProductsHome> createState() =>
      _YourSpecialProductsHomeState();
}

class _YourSpecialProductsHomeState extends State<YourSpecialProductsHome> {
  @override
  Widget build(BuildContext context) {
    buildBody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteRecommendationHomeBloc,
          RemoteRecommendationHomeState>(builder: (_, state) {
        if (state is RemoteRecommendationStateLoading) {
          logger.i(state.recommendations.toString());
          logger.i("Loading...");
          return const SizedBox(
            height: 200,
            child: Center(
              child: CupertinoActivityIndicator(color: textColor),
            ),
          );
        }

        if (state is RemoteRecommendationStateError) {
          return const Center(
            child: Text("No products found for the user"),
            //     child: Icon(
            //   Icons.refresh,
            //   color: textColor,
            // )
          );
        }
        int l = state.recommendations!.length;
        var products = state.recommendations;

        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 220.0, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: l, // Adjust the number of cards as needed
              itemBuilder: (context, index) {
                String name = products![index].product!;
                double cost = products[index].price!;
                String imageUrl = products[index].imageUrl!;
                return CoffeCardItem(
                    coffeeName: name, cost: cost, imageUrl: imageUrl);
              },
            ),
          ),
        );
      });
    }

    return buildBody();
  }
}
