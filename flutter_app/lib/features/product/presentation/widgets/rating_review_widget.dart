import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class RatingReviewWidget extends StatefulWidget {
  const RatingReviewWidget({super.key});

  @override
  State<RatingReviewWidget> createState() => _RatingReviewWidgetState();
}

class _RatingReviewWidgetState extends State<RatingReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star, color: textColor),
          Icon(Icons.star, color: textColor),
          Icon(Icons.star, color: textColor),
          Icon(Icons.star, color: textColor),
          Icon(Icons.star_border, color: textColor),
        ],
      ),
    );
  }
}
