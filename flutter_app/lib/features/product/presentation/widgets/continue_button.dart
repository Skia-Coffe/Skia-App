import 'package:flutter/material.dart';
import 'package:skia_coffee/features/product/presentation/pages/verified_address_page.dart';

import '../../../../core/constants/consts.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerifiedAddressPage()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Text(
            "Conitnue",
            style:
                TextStyle(fontFamily: bold, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
