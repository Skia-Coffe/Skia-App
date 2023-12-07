import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';

class ChangeButton extends StatefulWidget {
  const ChangeButton({super.key});

  @override
  State<ChangeButton> createState() => _ChangeButtonState();
}

class _ChangeButtonState extends State<ChangeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(elevation: 1),
        child: const Text(
          "Change",
          style: TextStyle(
              fontFamily: regular, fontSize: 13, fontWeight: FontWeight.w400),
        ));
  }
}
