import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/usecases/get_recommendations.dart';
import 'package:skia_coffee/features/home/presentation/bloc/your_special_products_bloc/remote_quiz_event.dart';
import 'package:skia_coffee/features/home/presentation/bloc/your_special_products_bloc/remote_recommendations_state.dart';

class RemoteRecommendationHomeBloc
    extends Bloc<RemoteRecommendationHomeEvent, RemoteRecommendationHomeState> {
  final GetRecommendationsHomeUseCase _getRecommendationsUseCase;
  RemoteRecommendationHomeBloc(this._getRecommendationsUseCase)
      : super(const RemoteRecommendationStateLoading()) {
    on<GetRecommendations>(onGetRecommendations);
  }

  void onGetRecommendations(GetRecommendations recommendations,
      Emitter<RemoteRecommendationHomeState> emit) async {
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
