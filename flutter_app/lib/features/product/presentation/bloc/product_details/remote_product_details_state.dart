import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';

abstract class RemoteProductDetailsState extends Equatable {
  final ProductDetailsEntity? productDetails;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteProductDetailsState({this.productDetails, this.error});
  @override
  List<Object?> get props => [productDetails!, error!];
}

class RemoteProductDetailsStateLoading extends RemoteProductDetailsState {
  const RemoteProductDetailsStateLoading();
}

class RemoteProductDetailsStateDone extends RemoteProductDetailsState {
  const RemoteProductDetailsStateDone(ProductDetailsEntity products)
      : super(productDetails: products);
}

class RemoteProductDetailsStateError extends RemoteProductDetailsState {
  // ignore: deprecated_member_use
  const RemoteProductDetailsStateError(DioError dioError)
      : super(error: dioError);
}
