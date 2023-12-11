import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_answers_sending_repository.dart';
import 'package:skia_coffee/features/quiz/data/datasources/remote/quiz_api_service.dart';
import 'package:skia_coffee/features/quiz/data/models/request_model.dart';

class QuizAnswerSendingRepositoryImpl implements QuizAnswerSendingRepository {
  // ignore: unused_field
  final QuizApiService _quizApiService;
  QuizAnswerSendingRepositoryImpl(this._quizApiService);

  @override
  Future<DataState<String>> sendAnswers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Logger logger = Logger();
    RequestModel sendData = RequestModel(
        flavour: pref.getString("flavour"),
        roast: pref.getString("roast"),
        brewMethod: pref.getString("brewMethod"),
        strong: pref.getBool("strong"),
        additionalFlavour: pref.getString("additionalFlavour"));
    try {
      // final httpResponse = await _quizApiService.getQuiz();
      String url = "$baseUrl/quiz";
      final httpResponse = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: sendData.toJson());
      if (httpResponse.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.body);
        // Parse the response body as a List<dynamic>
        List<dynamic> jsonData = json.decode(httpResponse.body);

        // Convert each dynamic element to a QuizModel
        String msg = jsonData.toString();

        logger.d(msg);
        return DataSuccess(msg);
      } else {
        return DataFailed(
            // ignore: deprecated_member_use
            DioError(
                error: httpResponse.statusCode,
                requestOptions: RequestOptions(),
                // ignore: deprecated_member_use
                type: DioErrorType.badResponse));
      }
      // ignore: deprecated_member_use
    } catch (e) {
      logger.i("Errors");
      logger.d(e.toString());
      return DataFailed(DioError(
          requestOptions: RequestOptions(),
          // ignore: deprecated_member_use
          type: DioErrorType.badResponse));
    }
  }
}
