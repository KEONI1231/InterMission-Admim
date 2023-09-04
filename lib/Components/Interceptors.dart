// interceptors.dart

import 'package:dio/dio.dart';

InterceptorsWrapper customInterceptor(Dio dio) {
  return InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // 요청 전에 실행될 코드
      return handler.next(options);
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) {
      // 응답 후에 실행될 코드
      return handler.next(response);
    },
    onError: (DioError e, ErrorInterceptorHandler handler) async {
      // 에러 처리 로직
      // ...
      return handler.next(e);
    },
  );
}
