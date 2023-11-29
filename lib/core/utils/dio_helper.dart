// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../res/res_api_names.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class DioHelper {
  static final instance = DioHelper._();

  static Dio dio = Dio(
    BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
      receiveDataWhenStatusError: true,
    ),
  );

  //Singleton
  DioHelper._() {
    // Attach Logger
    if (kDebugMode) dio.interceptors.add(_logger);
  }

  // Logger
  static final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );

  static init() {
    dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData(String url,
          {Map<String, dynamic>? query, String? token}) async =>
      await dio.get(
        url,
        queryParameters: query,
        options: Options(headers: {}),
      );

  Future<Response> postData(
    String url, {
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> body,
    FormData? multiPartBody,
  }) async =>
      await dio.post(
        url,
        queryParameters: query,
        data: multiPartBody ?? body,
        options: Options(headers: {}),
      );

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async =>
      dio.put(
        url,
        queryParameters: query,
        data: data,
        options: Options(headers: {}),
      );
}
