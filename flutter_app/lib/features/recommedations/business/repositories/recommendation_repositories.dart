import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/recommedations/business/entities/recommendation_entity.dart';

abstract class RecommendationRepository {
  Future<DataState<List<RecommendationEntity>>> getRecommendations();
}
