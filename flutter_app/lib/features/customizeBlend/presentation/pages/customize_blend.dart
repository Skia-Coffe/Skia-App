import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skia_coffee/features/customizeBlend/presentation/widgets/next_button.dart';
import 'package:skia_coffee/features/customizeBlend/presentation/widgets/option_card_button.dart';

import '../../../../core/constants/consts.dart';

class CustomBlendPage extends StatefulWidget {
  const CustomBlendPage({super.key});

  @override
  State<CustomBlendPage> createState() => _CustomBlendPageState();
}

class _CustomBlendPageState extends State<CustomBlendPage> {
  List<String> blendNames = ["Arabica", "Chicory", "Robusta"];
  List<String> type = [
    "Choose a Flavor",
    "Choose a Flavor",
    "Choice of roast",
    "Blend Size",
  ];

  List<List<String>> options = [
    ["Washed", "Honey", "None"],
    ["Fruity", "Nutty", "None"],
    ["Light", "Medium", "Dark"],
    ["Fine", "Medium", "Coarse"]
  ];

  int choosenIndex = 0;

  int choosedflavour = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: textColor,
                ),
              ),
              const SizedBox(
                  width: 48,
                  height: 32,
                  child: Image(image: AssetImage(icLogo), fit: BoxFit.cover)),
              const Icon(
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
                      onPressed: () {
                        setState(() {
                          choosenIndex = index;
                        });
                      },
                      child: Text(
                        blendNames[index],
                        style: TextStyle(
                            color:
                                index == choosenIndex ? textColor : appBarbg),
                      ));
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: type.length + 1,
                      itemBuilder: (context, index) => index == type.length
                          ? const NextButtonBlend()
                          : OptionCardButton(
                              index: index,
                              text: type[index],
                              options: options[index],
                            )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
