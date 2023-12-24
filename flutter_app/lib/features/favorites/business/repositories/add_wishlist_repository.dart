import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';

abstract class AddWishlistRepository {
  Future<void> addWishlist(AddWishlistEntity item);
}
