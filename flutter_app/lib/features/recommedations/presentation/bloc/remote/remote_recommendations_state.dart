import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/recommedations/business/entities/recommendation_entity.dart';

abstract class RemoteRecommendationState extends Equatable {
  final List<RecommendationEntity>? recommendations;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteRecommendationState({this.recommendations, this.error});

  @override
  List<Object?> get props => [recommendations!, error!];
}

class RemoteRecommendationStateLoading extends RemoteRecommendationState {
  const RemoteRecommendationStateLoading();
}

class RemoteRecommendationStateDone extends RemoteRecommendationState {
  const RemoteRecommendationStateDone(
      List<RecommendationEntity> recommendations)
      : super(recommendations: recommendations);
}

class RemoteRecommendationStateError extends RemoteRecommendationState {
  // ignore: deprecated_member_use
  const RemoteRecommendationStateError(DioError dioError)
      : super(error: dioError);
}
