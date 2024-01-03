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
  String? selectedValue = "1 bag";
  Logger logger = Logger();
  @override
  Widget build(BuildContext context) {
    buildBody() {
      return BlocBuilder<RemoteProductDetailsBloc, RemoteProductDetailsState>(
          builder: (_, state) {
        if (state is RemoteProductDetailsStateLoading) {
          logger.i("Loading...");
          return const SizedBox(
            height: 200,
            child: Center(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.product!,
                        style: const TextStyle(
                          fontFamily: bold,
                          fontSize: 24,
                          color: textColor,
                        ),
                      ),
                      const RatingWidget(),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "Rs ${p.price}",
                          style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      // "Sourced from the world's finest regions, our beans promise a symphony of flavors. From the delicate, floral notes of our light roast to the bold, smoky depths of our dark roast, each cup is a journey of taste. Ethically and sustainably grown, our coffee beans support communities and the environment.",
                      p.productInfo!,
                      style: const TextStyle(
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
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(icCoffeeBean),
                            ),
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
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                  'assets/icons/circum_coffee-bean (3).svg'),
                            ),
                            Text("${p.quantity}gm",
                                style: const TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                    fontFamily: regular,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'assets/icons/pepicons-pencil_stars (1).svg',
                                color: textColor,
                              ),
                            ),
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
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Customers Reviews",
                    style: TextStyle(
                      fontFamily: bold,
                      fontSize: 24,
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
                              borderRadius: BorderRadius.circular(10))),
                      child: const Row(
                        children: [
                          Icon(Icons.add, color: textColor),
                          SizedBox(width: 4),
                          Text(
                            "Add Review",
                            style: TextStyle(
                              fontFamily: bold,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 0),
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
            const SizedBox(width: double.infinity, child: ViewAllButton()),
            const SizedBox(
              height: 100,
            )
          ]),
        );
      });
    }

    return buildBody();
  }
}
