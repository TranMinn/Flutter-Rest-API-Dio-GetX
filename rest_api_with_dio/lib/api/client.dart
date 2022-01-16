import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// Dio client
Dio client() {
  Dio dio = new Dio();
  String baseUrl = 'https://reqres.in';

  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 10000;
  dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) =>
          requestInterceptor(options, handler),
      onResponse: (Response response, ResponseInterceptorHandler handler) =>
          responseInterceptor(response, handler),
      onError: (DioError error, ErrorInterceptorHandler handler) =>
          errorInterceptor(error, handler)));

  return dio;
}

// Logger
Logger logger = Logger();

requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) {
  logger.d(options);
  return options;
}

responseInterceptor(Response response, ResponseInterceptorHandler handler) {
  logger.d(response.statusCode);
  logger.d(response.data);
  return response;
}

errorInterceptor(DioError error, ErrorInterceptorHandler handler) {
  logger.d(error.error);
  logger.d(error.message);
  return error;
}
