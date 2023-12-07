import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/constants/icons.dart';

class AddressPageDart extends StatefulWidget {
  const AddressPageDart({super.key});

  @override
  State<AddressPageDart> createState() => _AddressPageDartState();
}

class _AddressPageDartState extends State<AddressPageDart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          boxShadow: const [
            BoxShadow(
              color: greyBg,
              spreadRadius: 2,
              blurRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vivek",
                  style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontFamily: bold,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    "Gf - 2, Cotha Pearl Apartment, 7th main, 17th cross, Btm 2nd stage Bangalore - 76",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColorMedium,
                        fontSize: 14,
                        fontFamily: regular,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                    maxLines: 4,
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
            SizedBox(
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.more_vert, color: textColor)],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Delivery address",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: 12,
                            fontFamily: bold,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        width: 15,
                        height: 15,
                        child: SvgPicture.asset(
                          icTick,
                          color: textColor,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
