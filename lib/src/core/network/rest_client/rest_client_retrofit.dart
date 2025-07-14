import 'package:crypto_app/src/core/network/url.dart';
import 'package:crypto_app/src/home/domain/entity/crypto_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rest_client_retrofit.g.dart';

@Injectable()
@RestApi(baseUrl: Url.baseUrl)
abstract class RetrofitClient {
  @factoryMethod
  factory RetrofitClient(Dio dio) = _RetrofitClient;

  @GET('/assets')
  Future<CryptoResponse> getCoins({@Query('offset') required int offset, @Query('limit') required int? limit});
}
