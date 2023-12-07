import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/styles.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.id,
    required this.index,
  }) : super(key: key);

  final String option;
  final int id;
  final int index;

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool isSelected = false;

  final List<String> t = const [
    "flavour",
    "roast",
    "brew_method",
    "strong",
    "additional_flavour"
  ];

  final Color selectedOptionColor = textColor;
  final Color unselectedOptionColor = Colors.transparent;

  final Color selectedOptionTextColor = white;
  final Color unselectedOptionTextColor = textColor;
  Logger logger = Logger();
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    logger.i("hi");
    prefs.setString(t[widget.index], widget.option);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextButton(
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
            if (isSelected == true) {
              saveData();
            }
          },
          style: TextButton.styleFrom(
            backgroundColor:
                isSelected ? selectedOptionColor : unselectedOptionColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: textColor, width: 1),
            ),
          ),
          child: Text(
            widget.option,
            style: TextStyle(
              fontFamily: bold,
              fontSize: 14,
              color: isSelected
                  ? selectedOptionTextColor
                  : unselectedOptionTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
