import 'package:skia_coffee/core/resources/data_state.dart';

abstract class QuizAnswerSendingRepository {
  Future<DataState<String>> sendAnswers();
}
