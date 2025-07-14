import 'dart:io';
import 'package:crypto_app/src/core/network/interceptors/primary_interceptor.dart';
import 'package:crypto_app/src/core/network/url.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDioConfigurator {

  const AppDioConfigurator();

  @Named('baseUrl')
  String get baseUrl => Url.baseUrl;

  @lazySingleton
  Dio create(@Named('baseUrl') String url) {
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