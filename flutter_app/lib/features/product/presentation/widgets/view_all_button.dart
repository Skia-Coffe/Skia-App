import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class ViewAllButton extends StatefulWidget {
  const ViewAllButton({super.key});

  @override
  State<ViewAllButton> createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<ViewAllButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: textColor,
              shadowColor: greyBg,
              elevation: 1,
              side: const BorderSide(
                color: greyBg,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: const Text("View-All", style: TextStyle(color: white)),
        ));
  }
}
