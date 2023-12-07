import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/icons.dart';
import 'package:skia_coffee/features/product/presentation/pages/cart_page.dart';
import 'package:skia_coffee/features/product/presentation/widgets/rating_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/review_widget.dart';

import '../../../../core/constants/consts.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedValue = "1 bag";
  @override
  Widget build(BuildContext context) {
    // double w = ((MediaQuery.of(context).size.width) / 390);
    // double h = ((MediaQuery.of(context).size.height) / 855);
    return Scaffold(
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250 * ((MediaQuery.of(context).size.width) / 390),
                  height: 50,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    child: Text("Add to Cart"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            height: 310,
            decoration: const BoxDecoration(
              color: darkBg,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Center(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(imBgCorousel1),
                const Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 180,
                          child: Image(
                            image: AssetImage(icCoffeeImage),
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          height: 40,
                          child: Image(
                            image: AssetImage(imEllipseBg),
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toraja Sulawesi",
                      style: TextStyle(
                        fontFamily: bold,
                        fontSize: 24,
                        color: textColor,
                      ),
                    ),
                    RatingWidget(),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Rs.300",
                        style: TextStyle(
                          fontFamily: regular,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 16),
                child: SizedBox(
                  child: Row(children: [
                    const Text(
                      "Quantity :",
                      style: TextStyle(
                          color: textColor,
                          fontFamily: regular,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: textColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: selectedValue,
                              style: const TextStyle(color: textColor),
                              items: <String>[
                                '1 bag',
                                '2 bags',
                                '3 bags',
                                '4 bags'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                                print('Selected: $newValue');
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Info",
                  style: TextStyle(
                    fontFamily: bold,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Sourced from the world's finest regions, our beans promise a symphony of flavors. From the delicate, floral notes of our light roast to the bold, smoky depths of our dark roast, each cup is a journey of taste. Ethically and sustainably grown, our coffee beans support communities and the environment.",
                    style: TextStyle(
                        fontFamily: regular,
                        fontSize: 10,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(icCoffeeBean),
                          const Text("100% Arabic Coffee",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(icCoffeeBeanBox),
                          const Text("250gm",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(icCoffeeBeanStar),
                          const Text("Sealed for freshness",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                  color: greyBg,
                  boxShadow: [
                    BoxShadow(
                      color: greyBg.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontFamily: bold,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          RatingWidget(),
                        ],
                      ),
                      Column(
                        children: List.generate(
                          2,
                          (index) => const ReviewWidget(),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          const SizedBox(
            height: 100,
          )
        ]),
      ),
    );
  }
}
