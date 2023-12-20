import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/auth/signUp/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final phoneNo = TextEditingController();
  final name = TextEditingController();
  String countryCode = "+91";

  Logger logger = Logger();
  void phoneAuthentication(String phoneNo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('UserName', name.text);
    logger.i("Authentication initialed");
    logger.i(phoneNo);
    AuthenticationRepository.to.phoneAuthentication(phoneNo);
  }
}
