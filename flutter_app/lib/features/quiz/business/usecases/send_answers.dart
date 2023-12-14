import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/quiz/business/repositories/quiz_answers_sending_repository.dart';

class SendAnswersUseCase extends UseCase {
  final QuizAnswerSendingRepository _answerSendingRepository;
  SendAnswersUseCase(this._answerSendingRepository);
  @override
  Future<void> call({void params}) {
    return _answerSendingRepository.sendAnswers();
  }
}
