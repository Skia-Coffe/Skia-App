import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Container(
        height: 30,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            cursorColor: textColor,
            style: const TextStyle(color: textColor),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
              hintText: "Search in Orders",
              hintStyle: TextStyle(color: Colors.black12),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
