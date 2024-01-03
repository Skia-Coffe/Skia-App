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
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.only(left: 10),
                  child: FloatingActionButton(
                    elevation: 30,
                    onPressed: () {
                      _onClicked(widget.prod, context);
                    },
                    backgroundColor: Colors.white,
                    child: isSelected
                        ? const Icon(
                            Icons.favorite,
                            color: textColor,
                          )
                        : const Icon(Icons.favorite_border, color: textColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 290 * ((MediaQuery.of(context).size.width) / 390),
                    height: 50,
                    child: FloatingActionButton(
                      elevation: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: white,
                            fontSize: 14,
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
