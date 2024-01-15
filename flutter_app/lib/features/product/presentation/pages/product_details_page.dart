import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/data/repositories/add_wishlist_repository_impl.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_bloc.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_event.dart';
import 'package:skia_coffee/features/product/presentation/pages/cart_page.dart';
import 'package:skia_coffee/features/product/presentation/pages/product_details_content.dart';
import 'package:skia_coffee/injection_container.dart';
import '../../../../core/constants/consts.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.prod});
  final String prod;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedValue = "1 bag";
  bool isSelected = false;
  final _auth = FirebaseAuth.instance;
  void _onClicked(String prod, BuildContext context) {
    // logger.i(prod);
    String userID = _auth.currentUser!.uid;
    AddWishlistEntity data = AddWishlistEntity(prod: prod, userID: userID);
    AddWishlistRepositoryImpl repo = AddWishlistRepositoryImpl();
    repo.addWishlist(data);
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final h16 = 16 * (h / 844);
    final h20 = 20 * (h / 844);
    final h12 = 12 * (h / 844);
    final h24 = 24 * (h / 844);
    final h40 = 40 * (h / 844);
    final h50 = 50 * (h / 844);

    final w16 = 16 * (w / 390);
    final w20 = 20 * (w / 390);
    final w10 = 10 * (w / 390);
    final w12 = 12 * (w / 390);
    final w14 = 14 * (w / 390);
    final w8 = 8 * (w / 390);
    final w24 = 24 * (w / 390);
    final w18 = 18 * (w / 390);

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.all(w8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: textColor,
                  ),
                ),
                const SizedBox(
                    width: 48,
                    height: 32,
                    child: Image(image: AssetImage(icLogo), fit: BoxFit.cover)),
                const Icon(
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w10),
                  child: FloatingActionButton(
                    elevation: 30,
                    onPressed: () {
                      _onClicked(widget.prod, context);
                    },
                    backgroundColor: Colors.white,
                    child: isSelected
                        ? Icon(
                            Icons.favorite,
                            color: textColor,
                            size: h40,
                          )
                        : const Icon(Icons.favorite_border, color: textColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w8),
                  child: SizedBox(
                    width: 290 * ((MediaQuery.of(context).size.width) / 390),
                    height: h50,
                    child: FloatingActionButton(
                      elevation: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: white,
                            fontSize: w14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: BlocProvider<RemoteProductDetailsBloc>(
          create: (context) => s1()..add(GetProductDetails(widget.prod)),
          child: const ProductDetailsContent(),
        ));
    // body: ProductDetailsContent());
  }
}
