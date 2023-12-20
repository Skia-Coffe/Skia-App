import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';

abstract class ProductsRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
  Future<DataState<ProductDetailsEntity>> getProductsDetails(String prod);
}
