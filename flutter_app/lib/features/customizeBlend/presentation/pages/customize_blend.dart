import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skia_coffee/core/constants/icons.dart';

import '../../../../core/constants/consts.dart';

class CustomBlendPage extends StatefulWidget {
  const CustomBlendPage({super.key});

  @override
  State<CustomBlendPage> createState() => _CustomBlendPageState();
}

class _CustomBlendPageState extends State<CustomBlendPage> {
  List<String> blendNames = ["Arabica", "Chicory", "Robusta"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: textColor,
              ),
              Image(image: AssetImage(icLogo)),
              Icon(
                Icons.shopping_bag_outlined,
                color: textColor,
              ),
            ],
          ),
        ),
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Customize your Coffee blend",
            style: TextStyle(fontFamily: bold, fontSize: 14, color: textColor),
          ),
          const Text(
            "Choose a Coffe bean you like",
            style: TextStyle(
                fontFamily: regular,
                fontSize: 10,
                color: textColor,
                fontWeight: FontWeight.w500),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CircleList(
                innerRadius: 52,
                outerRadius: 127,
                innerCircleColor: appBarbg,
                outerCircleColor: appBarbg.withOpacity(0.2),
                origin: Offset(0, 0),
                centerWidget: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(icLogo, fit: BoxFit.cover)),
                children: List.generate(3, (index) {
                  return TextButton(
                      onPressed: () {}, child: Text(blendNames[index]));
                }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 41),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: lightBg,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: const SingleChildScrollView(
                  child: Column(children: []),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
