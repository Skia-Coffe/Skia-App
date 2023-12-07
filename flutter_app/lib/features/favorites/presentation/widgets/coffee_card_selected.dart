import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';

class CoffeeCardSelected extends StatelessWidget {
  const CoffeeCardSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.black,
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.favorite, color: textColor)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
              child: Container(
                height: 130,
                width: 85,
                alignment: Alignment.center,
                child: Image.asset(icCoffeeImage),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 1),
              child: Text(
                "Toraja Sulawesi",
                style: TextStyle(
                    fontFamily: regular,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Rs. 300",
                style: TextStyle(
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
