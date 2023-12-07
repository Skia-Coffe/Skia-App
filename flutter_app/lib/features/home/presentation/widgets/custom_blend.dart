import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/constants/icons.dart';

import 'package:skia_coffee/features/skeleton/bottom_navigation.dart';

class CustomBlendWidget extends StatelessWidget {
  const CustomBlendWidget({super.key});
  void changeScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const BottomNavigation(curHome: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen(context);
      },
      child: Container(
        width: 240,
        height: 78,
        decoration: BoxDecoration(
            border: Border.all(
              color: textColor,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(45),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Custom Blend",
                style: TextStyle(
                  fontFamily: bold,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SvgPicture.asset(
                icBlend,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
