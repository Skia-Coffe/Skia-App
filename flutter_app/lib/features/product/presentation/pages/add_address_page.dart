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
