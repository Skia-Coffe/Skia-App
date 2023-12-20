import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class NextButtonBlend extends StatefulWidget {
  const NextButtonBlend({super.key});

  @override
  State<NextButtonBlend> createState() => _NextButtonBlendState();
}

class _NextButtonBlendState extends State<NextButtonBlend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Text(
            "Next",
            style:
                TextStyle(fontFamily: bold, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
