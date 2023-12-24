import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/favorites/business/entities/wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/repositories/wishlist_repository.dart';
import 'package:http/http.dart' as http;
import 'package:skia_coffee/features/favorites/data/models/wishlist_model.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  Logger logger = Logger();
  @override
  Future<DataState<List<WishlistEntity>>> getWishlist(String userID) async {
    logger.i("fetch started");
    try {
      String url = "$baseUrl/wishlist/$userID";
      final response = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic>? jsonData = json.decode(response.body);
        logger.i("APi response");
        logger.i(jsonData);
        if (jsonData != null && jsonData.isNotEmpty) {
          List<WishlistModel> items = jsonData
              .map((dynamic data) => WishlistModel.fromJson(data))
              .toList();
          return DataSuccess(items);
        } else {
          return DataFailed(
              // ignore: deprecated_member_use
              DioError(
                  error: response.statusCode,
                  requestOptions: RequestOptions(),
                  // ignore: deprecated_member_use
                  type: DioErrorType.badResponse));
        }
      } else {
        return DataFailed(
            // ignore: deprecated_member_use
            DioError(
                error: response.statusCode,
                requestOptions: RequestOptions(),
                // ignore: deprecated_member_use
                type: DioErrorType.badResponse));
      }
    } catch (e) {
      logger.i(e);
      return DataFailed(DioError(
          requestOptions: RequestOptions(),
          // ignore: deprecated_member_use
          type: DioErrorType.badResponse));
    }
  }
}
