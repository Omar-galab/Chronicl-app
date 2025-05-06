import 'package:chronicle/core/api/api_config.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  Dio getDio({bool tokenInterceptor = false}) {
    Dio dio = Dio();
    dio.options.baseUrl = ApiConfig.BASE_URL;

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      request: true,
      compact: true,
    ));
    return dio;
  }
    
}