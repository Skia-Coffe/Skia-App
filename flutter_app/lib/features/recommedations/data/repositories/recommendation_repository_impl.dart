import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skia_coffee/core/constants/consts.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/features/recommedations/business/entities/recommendation_entity.dart';
import 'package:skia_coffee/features/recommedations/business/repositories/recommendation_repositories.dart';
import 'package:http/http.dart' as http;
import 'package:skia_coffee/features/recommedations/data/models/Recommedations_model.dart';
import 'package:skia_coffee/features/recommedations/data/models/request_model.dart';

class RecommendationRespositoryImp implements RecommendationRepository {
  @override
  Future<DataState<List<RecommendationEntity>>> getRecommendations() async {
    Logger logger = Logger();
    SharedPreferences pref = await SharedPreferences.getInstance();
    RequestModel sendData = RequestModel(
        flavour: pref.getString("flavour"),
        roast: pref.getString("roast"),
        brewMethod: pref.getString("brewMethod"),
        strong: pref.getBool("strong"),
        additionalFlavour: pref.getString("additionalFlavour"));
    String url = "$baseUrl/recommendation";

    try {
      // final httpResponse = await _quizApiService.getQuiz();
      final httpResponse = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(sendData.toJson()));

      if (httpResponse.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.body);
        // Parse the response body as a List<dynamic>
        List<dynamic> jsonData = json.decode(httpResponse.body);

        // Convert each dynamic element
        List<RecommendationModel> recommendations = jsonData
            .map((dynamic data) => RecommendationModel.fromJson(data))
            .toList();

        logger.d(recommendations);
        return DataSuccess(recommendations);
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
