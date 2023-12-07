import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/constants/icons.dart';

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({super.key});

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 64,
        color: Colors.white,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: SvgPicture.asset(icDeliveryTruck),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Delivery to 560072",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontFamily: regular,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:
                              160 * ((MediaQuery.of(context).size.width) / 390),
                          child: const Text(
                            "Ground Floor, 183, Old Outer Ring Rd.....",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: textLightColor,
                                fontSize: 10,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Text(
                          "Bengaluru",
                          style: TextStyle(
                              color: textLightColor,
                              fontSize: 10,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: greyBg,
                      elevation: 0.5,
                      fixedSize: const Size(56, 21),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Change",
                    style: TextStyle(
                        color: textLightColor,
                        fontSize: 10,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
