import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/product/business/repositories/products_repositories.dart';

class GetProductsUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final ProductsRepository _productRepository;

  GetProductsUseCase(this._productRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProducts();
  }
}
