import 'package:crypto_app/src/core/network/rest_client/i_rest_client.dart';
import 'package:crypto_app/src/core/utils/typedef.dart';
import 'package:dio/dio.dart';

final class RestClientDio implements IRestClient {
  const RestClientDio({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<JsonMap?> send({
    required String path,
    required String method,
    Object? body,
    Map<String, String>? headers,
    JsonMap? queryParams,
  }) async {
    try {
      final options = Options(
        headers: headers,
        method: method,
        contentType: 'application/json',
        responseType: ResponseType.json,
      );

      final response = await _dio.request<Object?>(
        path,
        queryParameters: queryParams,
        data: body,
        options: options,
      );

      return response.data as JsonMap?;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        Error.throwWithStackTrace(Exception('ConnectionException'), e.stackTrace);
      }
      if (e.response?.statusCode == 404) {
        return null;
      }
      if (e.response != null) {
        if (e.response!.data is JsonMap) {
          Error.throwWithStackTrace(Exception(e.error), e.stackTrace);
        }
      }
      Error.throwWithStackTrace(Exception(e.error), e.stackTrace);
    }
  }

  @override
  Future<JsonMap?> get(String path, {
    Map<String, String>? headers,
    Map<String, Object>? extra,
    JsonMap? queryParams,
  }) =>
      send(path: path, method: 'GET', headers: headers, queryParams: queryParams);


}