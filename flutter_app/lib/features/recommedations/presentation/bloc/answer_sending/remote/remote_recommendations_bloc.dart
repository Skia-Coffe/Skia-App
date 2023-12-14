import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/features/quiz/business/usecases/send_answers.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/answer_sending/remote/remote_quiz_event.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/answer_sending/remote/remote_recommendations_state.dart';

class RemoteAnswerSendingBloc
    extends Bloc<RemoteAnswerSendingEvent, RemoteAnswerSendingState> {
  final SendAnswersUseCase _sendAnswersUseCase;
  RemoteAnswerSendingBloc(this._sendAnswersUseCase)
      : super(const RemoteAnswerSendingStateLoading()) {
    on<SendAnswers>(onSendAnswers);
  }

  void onSendAnswers(
      SendAnswers result, Emitter<RemoteAnswerSendingState> emit) async {
    await _sendAnswersUseCase();
    emit(const RemoteAnswerSendingStateDone("Done"));
  }
}
