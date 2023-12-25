import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/repositories/add_wishlist_repository.dart';

class AddWishlistRepositoryImpl implements AddWishlistRepository {
  @override
  Future<void> addWishlist(AddWishlistEntity item) async {
    Logger logger = Logger();
    Dio dio = Dio();
    try {
      String url = "$baseUrl/wishlist/add";
      logger.i("hi");
      final response = await dio.post(url,
          data: item.toJson(), // Pass the data directly here
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 201) {
        Get.snackbar("Notification", "Item added successfully");
      } else {
        Get.snackbar("Error", "Something went wrong!");
      }
    } catch (e) {
      logger.i("yaha hu");
      logger.i(e);
      Get.snackbar("Error", "Something went wrong!");
    }
  }
}
