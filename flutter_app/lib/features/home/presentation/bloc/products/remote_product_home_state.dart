import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';

abstract class RemoteProductHomeState extends Equatable {
  final List<ProductEntity>? products;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteProductHomeState({this.products, this.error});

  @override
  List<Object?> get props => [products!, error!];
}

class RemoteProductHomeStateLoading extends RemoteProductHomeState {
  const RemoteProductHomeStateLoading();
}

class RemoteProductHomeStateDone extends RemoteProductHomeState {
  const RemoteProductHomeStateDone(List<ProductEntity> products)
      : super(products: products);
}

class RemoteProductHomeStateError extends RemoteProductHomeState {
  // ignore: deprecated_member_use
  const RemoteProductHomeStateError(DioError dioError) : super(error: dioError);
}
