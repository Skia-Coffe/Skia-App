// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:skia_coffee/features/customizeBlend/presentation/widgets/custom_edit_text.dart';
import 'package:skia_coffee/features/customizeBlend/presentation/widgets/done_button.dart';
import '../../../../core/constants/consts.dart';

class CustomBlendName extends StatefulWidget {
  const CustomBlendName({super.key});

  @override
  State<CustomBlendName> createState() => _CustomBlendNameState();
}

class _CustomBlendNameState extends State<CustomBlendName> {
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
      body: Center(
        child: Column(
          children: [
            const Text(
              "Customize your Coffee blend",
              style:
                  TextStyle(fontFamily: bold, fontSize: 14, color: textColor),
            ),
            const Text(
              "Choose a Coffe bean you like",
              style: TextStyle(
                  fontFamily: regular,
                  fontSize: 10,
                  color: textColor,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 150,
                height: 230,
                child: Image.asset(
                  icCoffeeImage,
                  fit: BoxFit.cover,
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
                  child: const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Name your coffee",
                                style: TextStyle(
                                  fontFamily: bold,
                                  fontSize: 32,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: CustomEditText(),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: DoneButtonBlend(),
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
