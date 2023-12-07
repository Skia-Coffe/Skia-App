import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/quiz/business/entities/quiz_entity.dart';

abstract class RemoteQuizState extends Equatable {
  final List<QuizEntity>? quizzes;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteQuizState({this.quizzes, this.error});

  @override
  List<Object?> get props => [quizzes!, error!];
}

class RemoteQuizStateLoading extends RemoteQuizState {
  const RemoteQuizStateLoading();
}

class RemoteQuizStateDone extends RemoteQuizState {
  const RemoteQuizStateDone(List<QuizEntity> quizzes) : super(quizzes: quizzes);
}

class RemoteQuizStateError extends RemoteQuizState {
  // ignore: deprecated_member_use
  const RemoteQuizStateError(DioError dioError) : super(error: dioError);
}
