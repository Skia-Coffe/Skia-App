import 'package:flutter/material.dart';
import 'package:skia_coffee/features/customizeBlend/data/datasources/product_data_source.dart';
import 'package:skia_coffee/features/product/presentation/widgets/search_bar.dart';
import 'package:skia_coffee/features/recommedations/presentation/widgets/add_to_card_button.dart';

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
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: textColor,
                  ),
                  Image(image: AssetImage(icLogo)),
                  Icon(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Set the number of columns
                      crossAxisSpacing: 8.0, // Set the spacing between columns
                      mainAxisSpacing: 0.0, // Set the spacing between rows
                      childAspectRatio:
                          0.55, // Adjust this value to set the size of each grid element
                    ),
                    itemCount: ProductsData()
                        .items
                        .length, // Set the number of entries
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ProductsData().items[index],
                          const AddToCartButton(),
                        ],
                      );
                    },
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
