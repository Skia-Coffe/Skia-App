import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_bloc.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_event.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_state.dart';
import 'package:skia_coffee/features/favorites/presentation/widgets/coffee_card.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';
import 'package:skia_coffee/injection_container.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    Logger logger = Logger();
    buildbody() {
      return BlocBuilder<RemoteWishlistBloc, RemoteWishlistState>(
          builder: (_, state) {
        if (state is RemoteWishlistStateLoading) {
          logger.i("Loading...");
          return const SizedBox(
            height: 200,
            child: Center(
              child: CupertinoActivityIndicator(color: textColor),
            ),
          );
        }

        if (state is RemoteWishlistStateFailed) {
          return const Center(
              child: Icon(
            Icons.refresh,
            color: textColor,
          ));
        }

        return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          CoffeeCard(name: "Toraja Sulawesi", price: "Rs 300"),
                          AddToCartButton(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ));
      });
      //
    }

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
        body: BlocProvider<RemoteWishlistBloc>(
          create: (context) =>
              s1()..add(GetWishlistProducts(auth.currentUser!.uid)),
          child: buildbody(),
        ));
  }
}
