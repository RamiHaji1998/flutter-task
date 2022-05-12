import 'package:dio/dio.dart';
import '../constants/urls.dart';
import 'request_interceptor.dart';

class DioFactory {
  static Dio dioSetUp() {
    final BaseOptions options = BaseOptions(
      baseUrl: ConstUrls.baseUrl,
      sendTimeout: 20000,
      connectTimeout: 20000,
      receiveTimeout: 40000,
      contentType: "application/json",
    );
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      RequestInterceptor(),
    ]);
    return dio;
  }
}
