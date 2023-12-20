import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/product/presentation/pages/product_details_page.dart';

class CoffeeCard extends StatelessWidget {
  final String name, price;
  const CoffeeCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.favorite_border, color: textColor)],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(prod: name)));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Container(
                  height: 130,
                  width: 85,
                  alignment: Alignment.center,
                  child: Image.asset(icCoffeeImage),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
              child: Text(
                name,
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
                price,
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
