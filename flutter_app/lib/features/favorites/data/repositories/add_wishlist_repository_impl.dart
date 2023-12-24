import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/repositories/add_wishlist_repository.dart';
import 'package:http/http.dart' as http;
import 'package:skia_coffee/features/favorites/presentation/pages/favorite_page.dart';

class AddWishlistRepositoryImpl implements AddWishlistRepository {
  @override
  Future<void> addWishlist(AddWishlistEntity item) async {
    Logger logger = Logger();
    try {
      String url = "$baseUrl/wishlist/add";
      final response = await http
          .post(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        Get.snackbar("Notification", "Item added successfully");
        Get.off(const FavoritesPage());
      } else {
        Get.snackbar("Error", "Something went wrong!");
      }
    } catch (e) {
      logger.i(e);
      Get.snackbar("Error", "Something went wrong!");
    }
  }
}
