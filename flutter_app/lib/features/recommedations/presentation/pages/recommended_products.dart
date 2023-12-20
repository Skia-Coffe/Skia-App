import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_bloc.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_state.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/coffee_card.dart';

class RecommendedProductsLayout extends StatefulWidget {
  const RecommendedProductsLayout({super.key});

  @override
  State<RecommendedProductsLayout> createState() =>
      _RecommendedProductsLayoutState();
}

class _RecommendedProductsLayoutState extends State<RecommendedProductsLayout> {
  @override
  Widget build(BuildContext context) {
    buildbody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteRecommendationBloc, RemoteRecommendationState>(
          builder: (_, state) {
        if (state is RemoteRecommendationStateLoading) {
          logger.i(state.recommendations.toString());
          logger.i("Loading...");
          return const SizedBox(
            height: 400,
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
            //   color: textColor,)
          );
        }

        int l = state.recommendations!.length;
        var products = state.recommendations!;
        return Expanded(
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
                        name: products[index].product!,
                        price: products[index].price!.toString()),
                    const AddToCartButton(),
                  ],
                );
              },
            ),
          ),
        );
      });
    }

    return buildbody();
  }
}
