import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/constants/icons.dart';
import 'package:skia_coffee/features/product/presentation/widgets/rating_widget.dart';
import 'package:skia_coffee/features/profile/presentation/widgets/rating_widget.dart';

class DeliveredWidget extends StatefulWidget {
  const DeliveredWidget({super.key});

  @override
  State<DeliveredWidget> createState() => _DeliveredWidgetState();
}

class _DeliveredWidgetState extends State<DeliveredWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        icTick,
                        color: green,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivered",
                            style: TextStyle(
                                color: green,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal),
                          ),
                          Text(
                            "On Sun, 10 Sep",
                            style: TextStyle(
                                color: textLightColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: greyBg,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 1,
                      color: white,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 4,
                              blurRadius: 4,
                              color: greyBg,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Image.asset(icCoffeeImage),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Toraja Sulawesi",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                "Size: 250gm",
                                style: TextStyle(
                                    color: textLightColor,
                                    fontSize: 12,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Order Number :",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "SKIA-16453762-09374",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: greyBg,
                    boxShadow: const [
                      BoxShadow(spreadRadius: 1, blurRadius: 1, color: white)
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(children: [
                      Text(
                        "Rate Product",
                        style: TextStyle(
                            color: textLightColor,
                            fontSize: 12,
                            fontFamily: regular,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                      RatingWidgetOrders()
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
