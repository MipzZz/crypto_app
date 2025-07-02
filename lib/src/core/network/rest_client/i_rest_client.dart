import 'package:crypto_app/src/core/utils/typedef.dart';

abstract interface class IRestClient {
  Future<JsonMap?> send({
    required String path,
    required String method,
    Object? body,
    Map<String, String>? headers,
    JsonMap? queryParams,
  });

  Future<JsonMap?> get(
      String path, {
        Map<String, String>? headers,
        JsonMap? queryParams,
      });
}