import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteAnswerSendingState extends Equatable {
  final String? result;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteAnswerSendingState({this.result, this.error});

  @override
  List<Object?> get props => [result!, error!];
}

class RemoteAnswerSendingStateLoading extends RemoteAnswerSendingState {
  const RemoteAnswerSendingStateLoading();
}

class RemoteAnswerSendingStateDone extends RemoteAnswerSendingState {
  const RemoteAnswerSendingStateDone(String result) : super(result: result);
}

class RemoteAnswerSendingStateError extends RemoteAnswerSendingState {
  // ignore: deprecated_member_use
  const RemoteAnswerSendingStateError(DioError dioError)
      : super(error: dioError);
}
