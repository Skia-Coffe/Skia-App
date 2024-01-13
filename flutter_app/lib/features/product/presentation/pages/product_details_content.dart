import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_bloc.dart';
import 'package:skia_coffee/features/product/presentation/bloc/product_details/remote_product_details_state.dart';
import 'package:skia_coffee/features/product/presentation/widgets/rating_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/review_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/view_all_button.dart';

import '../../../../core/constants/consts.dart';
import '../../../../core/constants/icons.dart';

class ProductDetailsContent extends StatefulWidget {
  const ProductDetailsContent({super.key});

  @override
  State<ProductDetailsContent> createState() => _ProductDetailsContentState();
}

class _ProductDetailsContentState extends State<ProductDetailsContent> {
  String? selectedValue = "100g";
  Logger logger = Logger();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final h16 = 16 * (h / 844);
    final h18 = 18 * (h / 844);
    final h20 = 20 * (h / 844);
    final h12 = 12 * (h / 844);
    final h24 = 24 * (h / 844);
    final h34 = 34 * (h / 844);
    final h40 = 40 * (h / 844);
    final h30 = 30 * (h / 844);
    final h310 = 310 * (h / 844);
    final h200 = 200 * (h / 844);

    final w16 = 16 * (w / 390);
    final w20 = 20 * (w / 390);
    final w12 = 12 * (w / 390);
    final w14 = 14 * (w / 390);
    final w8 = 8 * (w / 390);
    final w24 = 24 * (w / 390);
    final w34 = 34 * (w / 390);
    final w18 = 18 * (w / 390);
    final w10 = 10 * (w / 390);
    final w40 = 40 * (w / 390);
    final w200 = 200 * (w / 390);
    final w150 = 150 * (w / 390);

    buildBody() {
      return BlocBuilder<RemoteProductDetailsBloc, RemoteProductDetailsState>(
          builder: (_, state) {
        if (state is RemoteProductDetailsStateLoading) {
          logger.i("Loading...");
          return SizedBox(
            height: h200,
            child: const Center(
              child: CupertinoActivityIndicator(color: textColor),
            ),
          );
        }
        if (state is RemoteProductDetailsStateError) {
          return const Center(
              child: Icon(
            Icons.refresh,
            color: textColor,
          ));
        }

        ProductDetailsEntity p = state.productDetails!;
        logger.i(p.dairyPreference);

        return SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    padding: EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 180,
                            child: Image(
                              image: AssetImage(icCoffeeImage),
                              // image: NetworkImage(p.imageUrl!),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: w200,
                  decoration: BoxDecoration(
                      border: Border.all(color: darkBg, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: milkbg.withOpacity(0.3),
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(icMilkBg),
                        Text(
                          "${p.dairyPreference} Recommended",
                          style: TextStyle(
                              color: textColor,
                              fontSize: w14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w16, top: w20, bottom: w16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w200,
                        child: Text(
                          p.product!,
                          style: TextStyle(
                            fontFamily: bold,
                            fontSize: w24,
                            color: textColor,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "Rs. ${p.price}",
                          style: TextStyle(
                            fontFamily: regular,
                            fontSize: w18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: w16, top: w20),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(children: [
                          Text(
                            "Quantity :",
                            style: TextStyle(
                                color: textColor,
                                fontFamily: regular,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: w14),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Container(
                              height: h40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(w10)),
                              child: Padding(
                                padding: EdgeInsets.all(w8),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: selectedValue,
                                    style: TextStyle(
                                        color: textColor, fontSize: w12),
                                    items: <String>[
                                      '100g',
                                      '250g',
                                      '500g',
                                      '1kg'
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
                      const SizedBox(height: 4),
                      const RatingWidget(n: 0),
                    ],
                  ),
                ),
                // const RatingWidget(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(w16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Info :",
                    style: TextStyle(
                      fontFamily: bold,
                      color: black,
                      fontSize: w18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: w8),
                    child: Text(
                      // "Sourced from the world's finest regions, our beans promise a symphony of flavors. From the delicate, floral notes of our light roast to the bold, smoky depths of our dark roast, each cup is a journey of taste. Ethically and sustainably grown, our coffee beans support communities and the environment.",
                      p.productInfo!,
                      maxLines: 10,
                      style: TextStyle(
                          fontFamily: regular,
                          fontSize: w12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: SizedBox(
                                width: w18,
                                height: h18,
                                child: SvgPicture.asset(icCoffeeBean,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Text("100% Arabica Coffee",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: w12,
                                    fontFamily: regular,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: SizedBox(
                                width: w18,
                                height: h18,
                                child: SvgPicture.asset(
                                    'assets/icons/circum_coffee-bean (4).svg'),
                              ),
                            ),
                            Text("${p.roast}",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: w12,
                                    fontFamily: regular,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: w16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: SvgPicture.asset(
                                  'assets/icons/carbon_location.svg',
                                  color: textColor,
                                ),
                              ),
                              Text("Coorg",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: w12,
                                      fontFamily: regular,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(w16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Brew Method :",
                          style: TextStyle(
                            fontFamily: bold,
                            color: black,
                            fontSize: w18,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: h12),
                      Row(
                        children: [
                          SizedBox(
                              width: w34,
                              height: h34,
                              child: Image.asset(icBrewMedthod)),
                          SizedBox(width: w8),
                          Text(p.brewMethod!,
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: w12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Cupping Score :",
                          style: TextStyle(
                            fontFamily: bold,
                            color: black,
                            fontSize: w18,
                            fontStyle: FontStyle.normal,
                          )),
                      Text(p.cuppingScore!.toString(),
                          style: TextStyle(
                              color: textColor,
                              fontSize: w40,
                              fontFamily: regular,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(w16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sensory Flavours :",
                      style: TextStyle(
                        fontFamily: bold,
                        color: black,
                        fontSize: w18,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(height: h16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                              'assets/icons/mdi_fruit-pineapple.svg',
                              color: textColor,
                            ),
                          ),
                          Text("Pineapple",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: w12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                              'assets/icons/raspberry.svg',
                              color: textColor,
                            ),
                          ),
                          Text("Rasberpberry",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: w12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                              'assets/icons/chocolate-bar.svg',
                              color: textColor,
                            ),
                          ),
                          Text("Chocolate",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: w12,
                                  fontFamily: regular,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: w16, right: w16, top: w16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customers Reviews",
                    style: TextStyle(
                      fontFamily: bold,
                      fontSize: w20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(
                            color: textColor,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(w10))),
                      child: Row(
                        children: [
                          Icon(Icons.add, color: textColor, size: w14),
                          const SizedBox(width: 4),
                          Text(
                            "Add Review",
                            style: TextStyle(
                              fontFamily: bold,
                              fontSize: w14,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: w16, right: w16, top: w16, bottom: 0),
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                fontFamily: bold,
                                fontSize: w18,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            const RatingWidget(n: 2),
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
            const SizedBox(width: double.infinity, child: ViewAllButton()),
            const SizedBox(
              height: 150,
            )
          ]),
        );
      });
    }

    return buildBody();
  }
}
