import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/coffee_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Wishlist",
          style: TextStyle(
              color: textColor,
              fontFamily: regular,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 60,
        backgroundColor: greyBg,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns
                  crossAxisSpacing: 8.0, // Set the spacing between columns
                  mainAxisSpacing: 0.0, // Set the spacing between rows
                  childAspectRatio:
                      0.55, // Adjust this value to set the size of each grid element
                ),
                itemCount: 10, // Set the number of entries
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      CoffeeCard(),
                      AddToCartButton(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
