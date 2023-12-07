import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/recommedations/business/usecases/get_recommendations.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_quiz_event.dart';
import 'package:skia_coffee/features/recommedations/presentation/bloc/remote/remote_recommendations_state.dart';

class RemoteRecommendationBloc
    extends Bloc<RemoteRecommendationEvent, RemoteRecommendationState> {
  final GetRecommendationsUseCase _getRecommendationsUseCase;
  RemoteRecommendationBloc(this._getRecommendationsUseCase)
      : super(const RemoteRecommendationStateLoading()) {
    on<GetRecommendations>(onGetRecommendations);
  }

  void onGetRecommendations(GetRecommendations recommendations,
      Emitter<RemoteRecommendationState> emit) async {
    final dataState = await _getRecommendationsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteRecommendationStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteRecommendationStateError(dataState.error!));
    }
  }
}
