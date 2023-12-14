import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';
import 'package:skia_coffee/features/product/business/repositories/products_repositories.dart';

class GetProductDetialsUseCase
    implements UseCase<DataState<List<ProductDetailsEntity>>, String> {
  final ProductsRepository _productsRepository;
  GetProductDetialsUseCase(this._productsRepository);

  @override
  Future<DataState<List<ProductDetailsEntity>>> call({String? params}) {
    Logger logger = Logger();
    logger.i("hi+$params");
    return _productsRepository.getProductsDetails(params!);
  }
}
