import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/product/presentation/pages/add_address_page.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddAddressPage()));
          },
          style: TextButton.styleFrom(
              backgroundColor: white,
              shadowColor: greyBg,
              elevation: 1,
              side: const BorderSide(
                color: greyBg,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: const Icon(
            Icons.add,
            color: textColor,
          )),
    );
  }
}
