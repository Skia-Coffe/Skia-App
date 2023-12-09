import 'package:get/get.dart';
import 'package:skia_coffee/auth/signUp/repository/authentication_repository.dart';
import 'package:skia_coffee/features/quiz/presentation/pages/quiz_page.dart';

class OTPLoginController extends GetxController {
  static OTPLoginController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.to.verifyOTP(otp);
    if (isVerified) {
      Get.snackbar("Welcome!", "You logged in Successfully !");
      // AuthenticationRepository.to.registerFirebaseUser();
    }
    isVerified ? Get.offAll(const QuizPage()) : Get.back();
  }
}
