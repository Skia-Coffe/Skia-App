import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/auth/login/presentation/pages/login_page.dart';
import 'package:skia_coffee/auth/signUp/models/firebaserUserDataModel.dart';
import 'package:skia_coffee/auth/signUp/models/userVerificationModel.dart';
import 'package:skia_coffee/auth/signUp/presentation/controllers/signUp_controller.dart';
import 'package:skia_coffee/auth/signUp/presentation/pages/signup_pages.dart';

import '../../../core/constants/consts.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get to => Get.find();
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  Logger logger = Logger();

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'Invalid Phone Number \n Try again!');
            Get.to(const LoginPage());
          } else {
            Get.snackbar('Error', e.toString());
            logger.i(e.toString());
            Get.to(() => const LoginPage());
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } catch (e) {
      print('Error during phone authentication: $e');
      // Handle the error as needed
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId.value,
          smsCode: otp,
        ),
      );
      return credentials.user != null;
    } catch (e) {
      Get.snackbar('Error during OTP verification:', e.toString());
      return false;
      // Handle the error as needed
    }
  }

  Future<void> registerFirebaseUser() async {
    User? user = _auth.currentUser;

    if (user != null) {
      String userID = user.uid;
      String name = SignUpController.instance.name.text;
      String phoneNumber = SignUpController.instance.phoneNo.text;

      FirebaseUserModel userModel = FirebaseUserModel(
          userID: userID, name: name, phoneNumber: phoneNumber);

      String url = "$baseUrl/user/firebasecreate";
      try {
        final response = await http.post(Uri.parse(url),
            body: jsonEncode(userModel.toJson()));

        logger.i(response.statusCode.toString());
        if (response.statusCode == 200) {
          Get.snackbar("Welcome!", "User succesfully registered.");
        } else {
          Get.snackbar("Welcome!", "You have logged in successfully.");
        }
      } catch (e) {
        logger.i(e.toString());
        Get.snackbar("Error", "Something went wrong");
        Get.to(SignUpPage());
      }
    }
  }

  Future<bool> checkUser(String phoneNo) async {
    String apiUrl = "$baseUrl/user/getuser";
    logger.i("checking started");
    Map<String, dynamic> requestData = {
      'phoneNumber': phoneNo,
    };
    UserVerificationModel data = UserVerificationModel(phoneNumber: phoneNo);
    logger.i(requestData['phoneNumber']);
    try {
      Uri url = Uri.parse(apiUrl).replace(queryParameters: data.toJson());

      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        logger.i(response.body.toString());
        Map<String, dynamic> responseBody = json.decode(response.body);

        Get.snackbar("Already User",
            "User already exist with this phone number please use other phone or login");
        Get.offAll(const LoginPage());
        return true;
      } else {
        Map<String, dynamic> responseBody = json.decode(response.body);
        logger.i(responseBody);
        Get.to(LoginPage());
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return false;
  }
}
