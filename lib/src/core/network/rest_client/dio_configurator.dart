import 'dart:io';
import 'package:crypto_app/src/core/network/interceptors/primary_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class AppDioConfigurator {

  const AppDioConfigurator();

  Dio create({required String url}) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();

        return client;
      },
    );

    dio.interceptors.addAll([ApiTokenInterceptor()]);

    return dio;
  }
}