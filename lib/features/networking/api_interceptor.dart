import 'dart:async';

import 'package:dio/dio.dart';
import 'package:journal_florist/exception/base_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:journal_florist/features/networking/token_repository.dart';

import 'endpoints.dart';

class APIInterceptors {
  static var baseOptions = BaseOptions(
    connectTimeout: 30000,
    baseUrl: Endpoints.baseUrl,
  );

  static Dio createDio() {
    return Dio(baseOptions);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(JournalInterceptor())
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> getRequest(String endpoint) async {
    Response response;

    try {
      response = await baseAPI.get(endpoint);
    } on DioError catch (e) {
      final errorMessage = BaseException.fromDioError(e).toString();
      throw errorMessage;
    }

    return response;
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    Response response;

    try {
      response = await baseAPI.post(
        endpoint,
        data: data,
      );
    } on DioError catch (e) {
      final errorMessage = BaseException.fromDioError(e).toString();
      throw errorMessage;
    }

    return response;
  }

  Future<Response> putRequest(String endpoint, dynamic data) async {
    Response response;

    try {
      response = await baseAPI.put(endpoint, data: data);
    } on DioError catch (e) {
      final errorMessage = BaseException.fromDioError(e).toString();
      throw errorMessage;
    }

    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    Response response;

    try {
      response = await baseAPI.delete(endpoint);
    } on DioError catch (e) {
      final errorMessage = BaseException.fromDioError(e).toString();
      throw errorMessage;
    }

    return response;
  }
}

class JournalInterceptor extends QueuedInterceptor {
  final TokenRepository tokenRepository = TokenRepository();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    BaseException.fromDioError(err);

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    tokenRepository.getUserToken().then((value) => {
          options.headers.addAll({'Authorization': 'Bearer $value'})
        });

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
