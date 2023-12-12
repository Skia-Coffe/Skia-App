import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';

abstract class RemoteRecommendationHomeState extends Equatable {
  final List<ProductEntity>? recommendations;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteRecommendationHomeState({this.recommendations, this.error});

  @override
  List<Object?> get props => [recommendations!, error!];
}

class RemoteRecommendationStateLoading extends RemoteRecommendationHomeState {
  const RemoteRecommendationStateLoading();
}

class RemoteRecommendationStateDone extends RemoteRecommendationHomeState {
  const RemoteRecommendationStateDone(List<ProductEntity> recommendations)
      : super(recommendations: recommendations);
}

class RemoteRecommendationStateError extends RemoteRecommendationHomeState {
  // ignore: deprecated_member_use
  const RemoteRecommendationStateError(DioError dioError)
      : super(error: dioError);
}
