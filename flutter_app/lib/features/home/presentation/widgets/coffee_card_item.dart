import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/styles.dart';
import 'package:skia_coffee/features/skeleton/bottom_navigation.dart';

class CoffeCardItem extends StatefulWidget {
  final String coffeeName;
  final double cost;
  final String imageUrl;
  const CoffeCardItem(
      {super.key,
      required this.coffeeName,
      required this.cost,
      required this.imageUrl});

  @override
  State<CoffeCardItem> createState() => _CoffeCardItemState();
}

class _CoffeCardItemState extends State<CoffeCardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation(
                            curHome: 2, name: widget.coffeeName)));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 16, 45, 0),
                child: Container(
                    height: 130,
                    width: 85,
                    alignment: Alignment.center,
                    child: Image.asset(icCoffeeImage)
                    //  Image.network(
                    //   widget.imageUrl, // Replace with your image URL
                    // ),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
              child: Text(
                widget.coffeeName,
                style: const TextStyle(
                    fontFamily: regular,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Rs. ${widget.cost}",
                style: const TextStyle(
                    fontFamily: regular,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
