import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/product/presentation/widgets/rating_review_widget.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: CircleAvatar(
                  radius: 30.0, // Adjust the radius as needed
                  backgroundImage: AssetImage(icCoffeeImage),
                ),
              ),
              SizedBox(height: 4)
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sourced from the world's finest regions, our beans promise a symphony of flavors. From the delicate, floral notes of our light roast to the bold, smoky depths of our dark roast, each cup is a journey of taste.",
                  overflow: TextOverflow.ellipsis, // Set overflow behavior
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: 12,
                    color: textLightColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: RatingReviewWidget(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
