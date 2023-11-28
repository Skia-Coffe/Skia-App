import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/quiz/data/models/quiz_model.dart';

part 'quiz_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuizApiService {
  factory QuizApiService(Dio dio) = _QuizApiService;

  @GET("/quiz")
  Future<HttpResponse<List<QuizModel>>> getQuiz();
}
