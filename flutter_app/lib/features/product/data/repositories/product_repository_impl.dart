import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/product/business/repositories/products_repositories.dart';

import '../../../../core/constants/consts.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<DataState<List<ProductEntity>>> getProducts() async {
    Logger logger = Logger();
    try {
      // final httpResponse = await _quizApiService.getQuiz();
      String url = "$baseUrl/product";
      final httpResponse = await http.get(Uri.parse(url));
      if (httpResponse.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.body);
        // Parse the response body as a List<dynamic>
        List<dynamic> jsonData = json.decode(httpResponse.body);

        // Convert each dynamic element to a QuizModel
        List<ProductModel> products = jsonData
            .map((dynamic data) => ProductModel.fromJson(data))
            .toList();

        logger.d(products);
        return DataSuccess(products);
      } else {
        return DataFailed(
            // ignore: deprecated_member_use
            DioError(
                error: httpResponse.statusCode,
                requestOptions: RequestOptions(),
                // ignore: deprecated_member_use
                type: DioErrorType.badResponse));
      }
      // ignore: deprecated_member_use
    } catch (e) {
      logger.i("Errors");
      logger.d(e.toString());
      return DataFailed(DioError(
          requestOptions: RequestOptions(),
          // ignore: deprecated_member_use
          type: DioErrorType.badResponse));
    }
  }
}
