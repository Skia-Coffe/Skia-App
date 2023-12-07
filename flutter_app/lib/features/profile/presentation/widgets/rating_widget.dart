import 'package:flutter/material.dart';

import '../../../../core/constants/consts.dart';

class RatingWidgetOrders extends StatefulWidget {
  const RatingWidgetOrders({super.key});

  @override
  State<RatingWidgetOrders> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidgetOrders> {
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
          Icon(
            Icons.star_border,
            color: textColor,
            size: 16,
          ),
        ],
      ),
    );
  }
}
