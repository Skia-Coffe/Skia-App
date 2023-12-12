import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_bloc.dart';
import 'package:skia_coffee/features/home/presentation/bloc/products/remote_product_home_state.dart';
import 'package:skia_coffee/features/home/presentation/widgets/coffee_card_item.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_bloc.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_state.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/coffee_card.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    buildBody() {
      Logger logger = Logger();
      return BlocBuilder<RemoteProductsBloc, RemoteProductsState>(
          builder: (_, state) {
        if (state is RemoteProductsStateLoading) {
          logger.i(state.products.toString());
          logger.i("Loading...");
          return const SizedBox(
            height: 200,
            child: Center(
              child: CupertinoActivityIndicator(color: textColor),
            ),
          );
        }

        if (state is RemoteProductsStateError) {
          return const Center(
              child: Icon(
            Icons.refresh,
            color: textColor,
          ));
        }
        int l = state.products!.length;
        var products = state.products;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
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
                String name = products![index].product!;
                double cost = products[index].price!;
                return Column(
                  children: [
                    CoffeeCard(name: name, price: cost.toString()),
                    const AddToCartButton(),
                  ],
                );
              },
            ),
          ),
        );
      });
    }

    return buildBody();
  }
}
