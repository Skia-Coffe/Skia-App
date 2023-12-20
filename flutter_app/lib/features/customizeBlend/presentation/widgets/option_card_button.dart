import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/consts.dart';

class OptionCardButton extends StatefulWidget {
  final int? index;
  final String? text;
  final List<String> options;
  const OptionCardButton(
      {super.key, this.index, this.text, required this.options});

  @override
  State<OptionCardButton> createState() => _OptionCardButtonState();
}

class _OptionCardButtonState extends State<OptionCardButton> {
  Logger logger = Logger();
  int curIndex = -1;
  String choosenOption = "";

  @override
  Widget build(BuildContext context) {
    logger.i(widget.index);
    List<String> op = widget.options;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                  border: Border.all(
                      color: curIndex == 0 ? textColor : Colors.transparent,
                      width: curIndex == 0 ? 2 : 0),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: curIndex == 0 ? 0 : 0.2,
                      blurRadius: 1,
                      offset: const Offset(-1, 1),
                    ),
                  ],
                ),
                width: 110,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      curIndex = 0;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    op[0],
                    style: const TextStyle(
                        fontFamily: bold, fontSize: 14, color: textColor),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: curIndex == 1 ? textColor : Colors.transparent,
                      width: curIndex == 1 ? 2 : 0),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: curIndex == 0 ? 0 : 0.2,
                      blurRadius: 1,
                      offset: const Offset(-1, 1),
                    ),
                  ],
                ),
                width: 110,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      curIndex = 1;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    op[1],
                    style: const TextStyle(
                        fontFamily: bold, fontSize: 14, color: textColor),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: curIndex == 2 ? textColor : Colors.transparent,
                      width: curIndex == 2 ? 2 : 0),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: curIndex == 0 ? 0 : 0.2,
                      blurRadius: 1,
                      offset: const Offset(-1, 1),
                    ),
                  ],
                ),
                width: 110,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      curIndex = 2;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    op[2],
                    style: const TextStyle(
                        fontFamily: bold, fontSize: 14, color: textColor),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
