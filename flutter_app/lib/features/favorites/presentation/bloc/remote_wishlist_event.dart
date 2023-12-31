import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';

abstract class RemoteWishlistEvent {
  final String? userID;
  final AddWishlistEntity? prod;
  const RemoteWishlistEvent({this.userID, this.prod});
}

class GetWishlistProducts extends RemoteWishlistEvent {
  const GetWishlistProducts(String userID) : super(userID: userID);
}

class AddWishlistProducts extends RemoteWishlistEvent {
  const AddWishlistProducts(AddWishlistEntity item, String userID)
      : super(prod: item, userID: userID);
}

class RemoveWishlisProducts extends RemoteWishlistEvent {
  const RemoveWishlisProducts(AddWishlistEntity item, String userID)
      : super(prod: item, userID: userID);
}
