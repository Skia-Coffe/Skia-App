import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class RatingWidget extends StatefulWidget {
  final int? n;
  const RatingWidget({super.key, this.n});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.star, color: textColor, size: 16),
          const Icon(Icons.star, color: textColor, size: 16),
          const Icon(Icons.star, color: textColor, size: 16),
          const Icon(Icons.star, color: textColor, size: 16),
          const Icon(Icons.star_border, color: textColor, size: 16),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "(${widget.n})",
              style: TextStyle(color: textLightColor),
            ),
          ),
        ],
      ),
    );
  }
}
