import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';
import 'package:skia_coffee/features/product/presentation/bloc/remote_product_home_event.dart';

abstract class ProductsRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
  Future<DataState<List<ProductDetailsEntity>>> getProductsDetails(String prod);
}
