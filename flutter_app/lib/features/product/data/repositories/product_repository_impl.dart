import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/home/business/entities/product_entity.dart';
import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';
import 'package:skia_coffee/features/product/business/repositories/products_repositories.dart';
import 'package:skia_coffee/features/product/data/models/product_details_model.dart';

import '../../../../core/constants/consts.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  Logger logger = Logger();
  @override
  Future<DataState<List<ProductEntity>>> getProducts() async {
    try {
      // final httpResponse = await _quizApiService.getQuiz();
      String url = "$baseUrl/product";
      final httpResponse = await http.get(Uri.parse(url));
      if (httpResponse.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.body);
        // Parse the response body as a List<dynamic>
        List<dynamic> jsonData = json.decode(httpResponse.body);

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

  @override
  Future<DataState<ProductDetailsEntity>> getProductsDetails(
      String prod) async {
    try {
      String url = "$baseUrl/product/$prod";
      final response = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      logger.i(prod);
      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic>? jsonData = json.decode(response.body);
        logger.i(jsonData);
        if (jsonData != null && jsonData.isNotEmpty) {
          ProductDetailsModel product =
              ProductDetailsModel.fromJson(jsonData['result']);
          return DataSuccess(product);
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
      logger.i("Errors");
      logger.i(e.toString());
      return DataFailed(DioError(
          requestOptions: RequestOptions(),
          // ignore: deprecated_member_use
          type: DioErrorType.badResponse));
    }
  }
}
