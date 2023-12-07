import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';

class LetsGoButton extends StatelessWidget {
  const LetsGoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: 100,
        height: 32,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Let's go",
                style:
                    TextStyle(fontFamily: bold, fontSize: 10, color: textColor),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
