import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';

abstract class RemoteProductsState extends Equatable {
  final List<ProductEntity>? products;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteProductsState({this.products, this.error});

  @override
  List<Object?> get props => [products!, error!];
}

class RemoteProductsStateLoading extends RemoteProductsState {
  const RemoteProductsStateLoading();
}

class RemoteProductsStateDone extends RemoteProductsState {
  const RemoteProductsStateDone(List<ProductEntity> products)
      : super(products: products);
}

class RemoteProductsStateError extends RemoteProductsState {
  // ignore: deprecated_member_use
  const RemoteProductsStateError(DioError dioError) : super(error: dioError);
}
