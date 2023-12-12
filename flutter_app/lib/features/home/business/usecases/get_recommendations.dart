import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/home/business/repositories/home_repositories.dart';

import '../../../../core/usecases/usecase.dart';

class GetRecommendationsHomeUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final HomeReprository _homeRepository;

  GetRecommendationsHomeUseCase(this._homeRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _homeRepository.getRecommendations();
  }
}
