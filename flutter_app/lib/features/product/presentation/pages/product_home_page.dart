import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_bloc.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_event.dart';
import 'package:skia_coffee/features/product/presentation/pages/all_products_page.dart';
import 'package:skia_coffee/features/product/presentation/pages/cart_page.dart';
import 'package:skia_coffee/features/product/presentation/widgets/search_bar.dart';
import 'package:skia_coffee/injection_container.dart';

import '../../../../core/constants/consts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      child:
                          Image(image: AssetImage(icLogo), fit: BoxFit.cover)),
                  GestureDetector(
                    onTap: () {
                      Get.to(const CartPage());
                    },
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: textColor,
                    ),
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
          body: Padding(
            padding: const EdgeInsets.only(top: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Text(
                  "Skia Coffee",
                  style: TextStyle(
                    fontFamily: bold,
                    fontSize: 32,
                  ),
                ),
              ),
              const SearchBarWidget(),
              BlocProvider<RemoteProductsBloc>(
                create: (context) => s1()..add(const GetProducts()),
                child: const AllProducts(),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
