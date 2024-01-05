import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/features/product/presentation/widgets/review_widget.dart';

import '../../../../core/constants/consts.dart';
import 'package:http/http.dart' as http;

class ViewAllButton extends StatefulWidget {
  const ViewAllButton({super.key});

  @override
  State<ViewAllButton> createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<ViewAllButton> {
  final _auth = FirebaseAuth.instance;
  Logger logger = Logger();
  void _showDialogBox() async {
    String userID = _auth.currentUser!.uid;
    String url = "$baseUrl/review/$userID";
    final res = await http.get(
      Uri.parse(url),
    );

    logger.i(res.body);
    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: const AlertDialog(
                  title: SizedBox(
                height: 600,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                      ReviewWidget(),
                    ],
                  ),
                ),
              )),
            );
          });
    } else {
      Get.snackbar("Error", "Something went wrong !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        child: TextButton(
          onPressed: () {
            _showDialogBox();
          },
          style: TextButton.styleFrom(
              backgroundColor: textColor,
              shadowColor: greyBg,
              elevation: 1,
              side: const BorderSide(
                color: greyBg,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              )),
          child: const Text("View-All", style: TextStyle(color: white)),
        ));
  }
}
