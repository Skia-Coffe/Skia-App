// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _QuizApiService implements QuizApiService {
  _QuizApiService(
    this._dio, {
    this.baseUrl,
  }) {
    _dio.options.baseUrl = baseUrl ?? 'http://192.168.153.216:50812';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<QuizModel>>> getQuiz() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<List<QuizModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/quiz',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
              baseUrl: _dio.options.baseUrl,
            )));
    List<QuizModel> value = ((_result.data as List<dynamic>?) ?? [])
        .map<QuizModel>(
            (dynamic i) => QuizModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
