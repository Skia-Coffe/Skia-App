import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option}) : super(key: key);
  final String option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: textColor, width: 1),
            ),
          ),
          child: Text(
            option,
            style: const TextStyle(
              fontFamily: bold,
              fontSize: 14,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
