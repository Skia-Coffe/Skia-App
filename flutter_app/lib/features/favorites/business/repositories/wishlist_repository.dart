import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/entities/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<DataState<List<WishlistEntity>>> getWishlist(String userID);
  Future<void> addWishlist(AddWishlistEntity prod);
  Future<void> removeWishlist(String userID, String name);
}
