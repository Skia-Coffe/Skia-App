import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_bloc.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_state.dart';
import 'package:skia_coffee/features/home/presentation/widgets/coffee_card_item.dart';

class SkiaSpecialProductsHome extends StatefulWidget {
  const SkiaSpecialProductsHome({super.key});

  @override
  State<SkiaSpecialProductsHome> createState() =>
      _SkiaSpecialProductsHomeState();
}

class _SkiaSpecialProductsHomeState extends State<SkiaSpecialProductsHome> {
  @override
  Widget build(BuildContext context) {
    buildBody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteProductHomeBloc, RemoteProductHomeState>(
          builder: (_, state) {
        if (state is RemoteProductHomeStateLoading) {
          logger.i(state.products.toString());
          logger.i("Loading...");
          return const SizedBox(
            height: 200,
            child: Center(
              child: CupertinoActivityIndicator(color: textColor),
            ),
          );
        }

        if (state is RemoteProductHomeStateError) {
          return const Center(
              child: Icon(
            Icons.refresh,
            color: textColor,
          ));
        }
        int l = state.products!.length;

        var products = state.products;
        // logger.i(products![0].product!);
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
                String imageUrl = products[index].image!;
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
