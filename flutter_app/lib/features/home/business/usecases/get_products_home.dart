import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/home/business/repositories/home_repositories.dart';

class GetProductHomeUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final HomeReprository _homeReprository;

  GetProductHomeUseCase(this._homeReprository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _homeReprository.getProducts();
  }
}
