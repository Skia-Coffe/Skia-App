import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_repository.dart';
import 'package:skia_coffee/features/quiz/data/datasources/remote/quiz_api_service.dart';
import 'package:skia_coffee/features/quiz/data/models/quiz_model.dart';

class QuizRepositoryImpl implements QuizReprository {
  final QuizApiService _quizApiService;
  QuizRepositoryImpl(this._quizApiService);

  @override
  Future<DataState<List<QuizModel>>> getQuizzes() async {
    final httpResponse = await _quizApiService.getQuiz();
    Logger logger = Logger();
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            // ignore: deprecated_member_use
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                requestOptions: httpResponse.response.requestOptions,
                // ignore: deprecated_member_use
                type: DioErrorType.badResponse));
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
