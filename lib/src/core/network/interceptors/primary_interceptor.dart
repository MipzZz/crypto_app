import 'package:dio/dio.dart';

class ApiTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apiKey'] = '8421c9c817d861674a80ae9db1a248fc3e2b4d2f26f83db141a9e4748a8cd271';
    return handler.next(options);
  }
}