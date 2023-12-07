import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/constants/icons.dart';

class CoffeCartWidget extends StatefulWidget {
  const CoffeCartWidget({super.key});

  @override
  State<CoffeCartWidget> createState() => _CoffeCartWidgetState();
}

class _CoffeCartWidgetState extends State<CoffeCartWidget> {
  String? selectedValue = '1';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        color: white,
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 82,
                  width: 82,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: Image.asset(icCoffeeImage),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Toraja Sulawesi",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontFamily: bold,
                      ),
                    ),
                    const Text(
                      "200g",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 8,
                          fontFamily: regular,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2, right: 4),
                            child: SizedBox(
                                height: 11,
                                width: 11,
                                child: SvgPicture.asset(icDeliveryTruck)),
                          ),
                          const Text(
                            "Delivery in 4-5 days",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 8,
                                fontFamily: regular,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.delete_outline),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
            child: Divider(
              height: 3,
              color: Colors.black12,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Quantity: ",
                      style: TextStyle(
                          color: textLightColor,
                          fontFamily: regular,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal),
                      textAlign: TextAlign.center,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedValue,
                        style: const TextStyle(color: textLightColor),
                        items: <String>['1', '2', '3', '4'].map((String value) {
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
                  ],
                ),
                const Text(
                  "Rs.300",
                  style: TextStyle(
                      color: textLightColor,
                      fontFamily: regular,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
