import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_repository.dart';
import 'package:skia_coffee/features/quiz/data/datasources/remote/quiz_api_service.dart';
import 'package:skia_coffee/features/quiz/data/models/quiz_model.dart';

class QuizRepositoryImpl implements QuizReprository {
  final QuizApiService _quizApiService;
  QuizRepositoryImpl(this._quizApiService);

  @override
  Future<DataState<List<QuizModel>>> getQuizzes() async {
    Logger logger = Logger();
    try {
      // final httpResponse = await _quizApiService.getQuiz();
      String url = "$baseUrl/quiz";
      final httpResponse = await http.get(Uri.parse(url));
      if (httpResponse.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.body);
        // Parse the response body as a List<dynamic>
        List<dynamic> jsonData = json.decode(httpResponse.body);

        // Convert each dynamic element to a QuizModel
        List<QuizModel> quizzes =
            jsonData.map((dynamic data) => QuizModel.fromJson(data)).toList();

        logger.d(quizzes);
        return DataSuccess(quizzes);
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
