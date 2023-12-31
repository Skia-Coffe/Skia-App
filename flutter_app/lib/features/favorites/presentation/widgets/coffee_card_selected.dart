import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_bloc.dart';
import 'package:skia_coffee/features/favorites/presentation/bloc/remote_wishlist_event.dart';

class CoffeeCardSelected extends StatefulWidget {
  final String? name;
  final String? price;
  const CoffeeCardSelected({super.key, this.name, this.price});

  @override
  State<CoffeeCardSelected> createState() => _CoffeeCardSelectedState();
}

class _CoffeeCardSelectedState extends State<CoffeeCardSelected> {
  final _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  void _onClicked(String prod, BuildContext context) {
    // logger.i(data);
    String userID = _auth.currentUser!.uid;
    AddWishlistEntity data = AddWishlistEntity(prod: prod, userID: userID);
    BlocProvider.of<RemoteWishlistBloc>(context)
        .add(RemoveWishlisProducts(data, userID));
    // AddWishlistProducts(data, userID);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
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
                      child: const Icon(Icons.favorite, color: textColor))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
              child: Container(
                height: 130,
                width: 85,
                alignment: Alignment.center,
                child: Image.asset(icCoffeeImage),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 1),
              child: Text(
                "Toraja Sulawesi",
                style: TextStyle(
                    fontFamily: regular,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Rs. 300",
                style: TextStyle(
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
