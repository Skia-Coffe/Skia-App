import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:skia_coffee/features/profile/presentation/pages/orders_page.dart';

class ItemWigdet extends StatelessWidget {
  final String head;
  final String desc;
  const ItemWigdet({super.key, required this.head, required this.desc});

  void penCorresspondingPage(String t, BuildContext context) {
    switch (t) {
      case ("Profile"):
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfilePage()));
        }
        break;
      case ("Orders"):
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrdersPage()));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          penCorresspondingPage(head, context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: const [
              BoxShadow(spreadRadius: 1, blurRadius: 2, color: greyBg)
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                head,
                style: const TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontFamily: regular,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                desc,
                style: const TextStyle(
                    color: textLightColor,
                    fontSize: 12,
                    fontFamily: regular,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
