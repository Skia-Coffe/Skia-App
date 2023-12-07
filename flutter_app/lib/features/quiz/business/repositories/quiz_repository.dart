import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/quiz/business/entities/quiz_entity.dart';

abstract class QuizReprository {
  Future<DataState<List<QuizEntity>>> getQuizzes();
}
