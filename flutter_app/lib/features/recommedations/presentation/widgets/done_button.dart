import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';
import 'package:skia_coffee/features/skeleton/bottom_navigation.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});
  void changeScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const BottomNavigation(curHome: 0)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            changeScreen(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Text(
            "Done",
            style:
                TextStyle(fontFamily: bold, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
