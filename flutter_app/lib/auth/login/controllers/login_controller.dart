import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/auth/signUp/repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final phoneNo = TextEditingController();
  final name = TextEditingController();

  Logger logger = Logger();
  void phoneAuthentication(String phoneNo) async {
    logger.i("Authentication initialed");
    logger.i(phoneNo);
    AuthenticationRepository.to.phoneAuthentication(phoneNo);
  }
}
