import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/endpoints.dart';

class JournalBaseHelper {
  static var baseOptions = BaseOptions(
    connectTimeout: 30000,
    baseUrl: Endpoints.baseUrl,
    responseType: ResponseType.json,
    contentType: ContentType.json.toString(),
  );

  static Dio createDio() {
    return Dio(baseOptions);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: requestInterceptor,
            onResponse: responseInterceptor,
            onError: errorInterceptor),
      );
  }

  static dynamic requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // String? token;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // token = prefs.getString("accessToken");

    // options.headers.addAll({
    //   "Authorization": "Bearer $token",
    // });
  }

  static dynamic responseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint(response.statusCode.toString() +
        "--> ${response.requestOptions.method != null ? response.requestOptions.method.toUpperCase() : 'METHOD'} ${"" + (response.requestOptions.baseUrl ?? "") + (response.requestOptions.path ?? "")}");

    if (response.data != null) {
      log("response: ->${response.data.toString()}");
    }
  }

  static dynamic errorInterceptor(
      DioError error, ErrorInterceptorHandler handler) {}

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> getRequest(String endpoint) async {
    Response response;

    try {
      response = await baseAPI.get(endpoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    Response response;

    try {
      response = await baseAPI.post(endpoint, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> putRequest(String endpoint, dynamic data) async {
    Response response;

    try {
      response = await baseAPI.put(endpoint, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    Response response;

    try {
      response = await baseAPI.delete(endpoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }
}
