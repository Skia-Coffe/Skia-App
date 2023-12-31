import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/data/repositories/add_wishlist_repository_impl.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_bloc.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_event.dart';
import 'package:skia_coffee/features/favorites/presentation/pages/favorite_page.dart';
import 'package:skia_coffee/features/product/presentation/pages/product_details_page.dart';
import 'package:skia_coffee/injection_container.dart';

class CoffeeCard extends StatefulWidget {
  final String name, price;
  const CoffeeCard({super.key, required this.name, required this.price});

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  bool isSelected = false;
  final _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  void _onClicked(String prod, BuildContext context) {
    logger.i(prod);
    String userID = _auth.currentUser!.uid;
    AddWishlistEntity data = AddWishlistEntity(prod: prod, userID: userID);
    // logger.i(data);
    // BlocProvider.of<RemoteWishlistBloc>(context)
    //     .add(AddWishlistProducts(data, userID));
    // BlocProvider<RemoteWishlistBloc>(
    //   create: (context) => s1()..add(AddWishlistProducts(data, userID)),
    //   child: const FavoritesPage(),
    // );
    // AddWishlistProducts(data, userID);
    AddWishlistRepositoryImpl repo = AddWishlistRepositoryImpl();
    repo.addWishlist(data);
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        _onClicked("Toraja Sulawesi89", context);
                      },
                      child: isSelected
                          ? const Icon(Icons.favorite, color: textColor)
                          : const Icon(Icons.favorite_border, color: textColor))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(prod: widget.name)));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Container(
                  height: 130,
                  width: 85,
                  alignment: Alignment.center,
                  child: Image.asset(icCoffeeImage),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontFamily: regular,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.price,
                style: const TextStyle(
                    fontFamily: regular,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
