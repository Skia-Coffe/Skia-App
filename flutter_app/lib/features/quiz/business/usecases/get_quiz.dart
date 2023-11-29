import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/quiz/business/entities/quiz_entity.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_repository.dart';

class GetQuizUseCase implements UseCase<DataState<List<QuizEntity>>, void> {
  final QuizReprository _quizReprository;

  GetQuizUseCase(this._quizReprository);
  @override
  Future<DataState<List<QuizEntity>>> call({void params}) {
    return _quizReprository.getQuizzes();
  }
}
