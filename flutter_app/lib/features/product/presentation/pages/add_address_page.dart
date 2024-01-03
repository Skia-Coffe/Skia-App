import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/product/presentation/widgets/add_address_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/continue_button.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final List<String> _fielItems = [
    "Name :",
    "Phone Number :",
    "Address House No :",
    "Area :",
    "District :",
    "State :",
    "Pin Code :",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Address",
                style: TextStyle(
                    fontFamily: regular,
                    fontSize: 24,
                    color: textColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
          ]),
        ),
        surfaceTintColor: Colors.white,
        centerTitle: true,
        backgroundColor: greyBg,
        elevation: 1.0,
        toolbarHeight: 60 * ((MediaQuery.of(context).size.height) / 844),
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 7) return ContinueButton();

                  return AddAddressWidget(_fielItems[index]);
                }),
          ),
        ],
      ),
    );
  }
}
