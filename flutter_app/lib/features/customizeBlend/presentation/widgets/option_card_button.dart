import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/consts.dart';

class OptionCardButton extends StatefulWidget {
  final int? index;
  final String? text;
  const OptionCardButton({super.key, this.index, this.text});

  @override
  State<OptionCardButton> createState() => _OptionCardButtonState();
}

class _OptionCardButtonState extends State<OptionCardButton> {
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    logger.i(widget.index);
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Text(
            widget.text!,
            style: const TextStyle(
                fontFamily: bold,
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: 110,
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  "Honey",
                  style: TextStyle(
                      fontFamily: bold, fontSize: 14, color: textColor),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: 110,
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  "Washed",
                  style: TextStyle(
                      fontFamily: bold, fontSize: 14, color: textColor),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: 110,
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  "None",
                  style: TextStyle(
                      fontFamily: bold, fontSize: 14, color: textColor),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
