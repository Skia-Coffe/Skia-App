import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';

abstract class HomeReprository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
