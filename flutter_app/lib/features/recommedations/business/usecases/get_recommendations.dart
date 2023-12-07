import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/recommedations/business/entities/recommendation_entity.dart';
import 'package:skia_coffee/features/recommedations/business/repositories/recommendation_repositories.dart';

import '../../../../core/usecases/usecase.dart';

class GetRecommendationsUseCase
    implements UseCase<DataState<List<RecommendationEntity>>, void> {
  final RecommendationRepository _recommendationRepository;

  GetRecommendationsUseCase(this._recommendationRepository);
  @override
  Future<DataState<List<RecommendationEntity>>> call({void params}) {
    return _recommendationRepository.getRecommendations();
  }
}
