import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_answers_sending_repository.dart';
import 'package:skia_coffee/features/quiz/data/models/request_model.dart';
import 'package:skia_coffee/features/quiz/presentation/pages/quiz_page.dart';
import 'package:skia_coffee/features/recommedations/presentation/pages/recommend_pages.dart';

class QuizAnswerSendingRepositoryImpl implements QuizAnswerSendingRepository {
  // ignore: unused_field

  @override
  Future<void> sendAnswers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Logger logger = Logger();
    var _auth = FirebaseAuth.instance;
    RequestModel sendData = RequestModel(
        UserID: _auth.currentUser!.uid,
        flavour: "Sample Flavour",
        roast: "Medium Roast",
        brewMethod: "Drip Brew",
        strong: "Mild",
        additionalFlavour: "Additional Flavour Description");
    try {
      // final httpResponse = await _quizApiService.getQuiz();
      // String url = "$baseUrl/quiz/save";
      // logger.i(sendData.toJson());
      // final httpResponse =
      //     await http.post(Uri.parse(url), body: sendData.toJson());
      final dio = Dio();
      dio.options.headers["Content-Type"] = "application/json";

      final httpResponse = await dio.post(
        "$baseUrl/quiz/save",
        data: sendData.toJson(),
      );
      if (httpResponse.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.data);
        // Parse the response body as a List<dynamic>
        // List<dynamic> jsonData = json.decode(httpResponse.data);

        // Convert each dynamic element to a QuizModel
        // String msg = jsonData.toString();

        // logger.i(msg);
        Get.offAll(() => RecommendPage());
      } else {
        logger.i(httpResponse.data.toString());
        Get.snackbar("Error", "something went wrong try again!");
        Get.off(const QuizPage());
      }
      // ignore: deprecated_member_use
    } catch (e) {
      logger.i("Oops");
      logger.i(e.toString());
      Get.snackbar("Error", "something went wrong try again!");
      Get.off(const QuizPage());
    }
  }
}
