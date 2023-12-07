import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class PriceDetailWidget extends StatefulWidget {
  const PriceDetailWidget({super.key});

  @override
  State<PriceDetailWidget> createState() => _PriceDetailWidgetState();
}

class _PriceDetailWidgetState extends State<PriceDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 145,
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Price Details",
                style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontFamily: regular,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cart MRP (2 items)",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontFamily: regular,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Rs.600",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontFamily: regular,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Shipping",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontFamily: regular,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.info_outline,
                          size: 8,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rs.100",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontFamily: regular,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: Colors.black12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You Pay",
                    style: TextStyle(
                        color: black,
                        fontSize: 12,
                        fontFamily: bold,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Rs.700",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontFamily: regular,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
