import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';

abstract class RemoteWishlistEvent {
  final String? userID;
  const RemoteWishlistEvent({this.userID});
}

class GetWishlistProducts extends RemoteWishlistEvent {
  const GetWishlistProducts(String userID) : super(userID: userID);
}

abstract class RemoteAddWishlistEvent {
  final AddWishlistEntity? addWishlistEntity;
  const RemoteAddWishlistEvent({this.addWishlistEntity});
}

class AddWishlistProducts extends RemoteAddWishlistEvent {
  const AddWishlistProducts(AddWishlistEntity item)
      : super(addWishlistEntity: item);
}
