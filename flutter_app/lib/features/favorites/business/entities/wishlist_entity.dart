import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final String id;
  final String userID;
  final List<WishlistItemEntity> wishlistItems;
  final int v;

  WishlistEntity({
    required this.id,
    required this.userID,
    required this.wishlistItems,
    required this.v,
  });

  @override
  List<Object?> get props => [id, userID, wishlistItems, v];
}

class WishlistItemEntity extends Equatable {
  final String product;
  final String id;

  WishlistItemEntity({
    required this.product,
    required this.id,
  });

  @override
  List<Object?> get props => [product, id];
}
