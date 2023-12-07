import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';

class AddAddressWidget extends StatefulWidget {
  final String heading;
  const AddAddressWidget(this.heading, {super.key});

  @override
  State<AddAddressWidget> createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.heading,
                style: const TextStyle(
                    color: textColor,
                    fontFamily: bold,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: textColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: textColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: textColor,
                        width: 1.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
