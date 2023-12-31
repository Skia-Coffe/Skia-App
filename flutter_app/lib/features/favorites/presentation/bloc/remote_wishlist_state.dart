import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:skia_coffee/features/favorites/business/entities/wishlist_entity.dart';

abstract class RemoteWishlistState extends Equatable {
  final List<WishlistEntity>? products;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteWishlistState({this.products, this.error});
  @override
  List<Object?> get props => [products!, error!];
}

class RemoteWishlistStateLoading extends RemoteWishlistState {
  const RemoteWishlistStateLoading();
}

class RemoteWishlistStateDone extends RemoteWishlistState {
  const RemoteWishlistStateDone(List<WishlistEntity> products)
      : super(products: products);
}

class RemoteWishlistStateFailed extends RemoteWishlistState {
  // ignore: deprecated_member_use
  const RemoteWishlistStateFailed(DioError dioError) : super(error: dioError);
}
