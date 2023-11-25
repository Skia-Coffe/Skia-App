import 'package:flutter/material.dart';
import 'package:skia_coffee/features/product/presentation/widgets/adress_page_widget.dart';
import 'package:skia_coffee/features/product/presentation/widgets/add_address_button.dart';

import '../../../../core/constants/consts.dart';

class VerifiedAddressPage extends StatefulWidget {
  const VerifiedAddressPage({super.key});
  @override
  State<VerifiedAddressPage> createState() => _VerifiedAddressPageState();
}

class _VerifiedAddressPageState extends State<VerifiedAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
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
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 2) return const AddAddressButton();
                  return const AddressPageDart();
                }),
          )
        ],
      ),
    );
  }
}
