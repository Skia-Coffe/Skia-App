import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/quiz/business/usecases/get_quiz.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_event.dart';
import 'package:skia_coffee/features/quiz/presentation/bloc/remote/remote_quiz_state.dart';

class RemoteQuizBloc extends Bloc<RemoteQuizEvent, RemoteQuizState> {
  final GetQuizUseCase _getQuizUseCase;

  RemoteQuizBloc(this._getQuizUseCase) : super(const RemoteQuizStateLoading()) {
    on<GetQuizzes>(onGetQuizzes);
  }

  void onGetQuizzes(GetQuizzes quiz, Emitter<RemoteQuizState> emit) async {
    final dataState = await _getQuizUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteQuizStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteQuizStateError(dataState.error!));
    }
  }
}
