import 'package:skia_coffee/features/favorites/business/entities/wishlist_entity.dart'; // Replace with the actual path

class WishlistModel extends WishlistEntity {
  WishlistModel({
    required String id,
    required String userID,
    required List<WishlistItemModel> wishlistItems,
    required int v,
  }) : super(id: id, userID: userID, wishlistItems: wishlistItems, v: v);

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['_id'] as String,
      userID: json['userID'] as String,
      wishlistItems: (json['wishlistItems'] as List<dynamic>)
          .map((item) => WishlistItemModel.fromJson(item))
          .toList(),
      v: json['__v'] as int,
    );
  }
}

class WishlistItemModel extends WishlistItemEntity {
  WishlistItemModel({
    required String product,
    required String id,
  }) : super(product: product, id: id);

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) {
    return WishlistItemModel(
      product: json['product'] as String,
      id: json['_id'] as String,
    );
  }
}
