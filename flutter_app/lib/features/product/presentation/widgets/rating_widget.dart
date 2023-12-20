import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star, color: textColor, size: 16),
          Icon(Icons.star, color: textColor, size: 16),
          Icon(Icons.star, color: textColor, size: 16),
          Icon(Icons.star, color: textColor, size: 16),
          Icon(Icons.star_border, color: textColor, size: 16),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "(122)",
              style: TextStyle(color: textLightColor),
            ),
          ),
        ],
      ),
    );
  }
}
