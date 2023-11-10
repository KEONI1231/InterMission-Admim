// interceptors.dart

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      if (e.response?.statusCode == 401) {
        // 액세스 토큰이 만료된 경우

        // 로컬 스토리지에서 리프레쉬 토큰 불러오기
        final prefs = await SharedPreferences.getInstance();
        String? refreshToken = prefs.getString('refreshToken');

        if (refreshToken == null) {
          // 리프레쉬 토큰이 없는 경우 (예: 사용자가 처음 로그인하는 경우)
          return handler.next(e);
        }
        RequestOptions requestOptions = e.requestOptions;
        // 액세스 토큰을 다시 받아오는 요청
        Response? tokenResponse;
        try {
          tokenResponse = await dio.post(
            'http://localhost:8080/api/auth/token',
            options: Options(
              headers: {
                'Authorization': 'Bearer $refreshToken',
              },
            ),
          );
        } catch (tokenError) {
          if (tokenError is DioError && tokenError.response?.statusCode == 401) {
            // 리프레쉬 토큰도 만료된 경우, 로그아웃 요청
            await dio.post(
              'http://34.64.77.5:8080/api/auth/logout',
              options: Options(
                headers: {
                  'Authorization': 'Bearer ${e.requestOptions.headers['Authorization']}',
                },
              ),
            );
            // 로그아웃 처리 로직 (예: 사용자에게 로그아웃 알림 표시)
            // admin 계정 로그아웃. 걍 튕겨버리기.
            return handler.next(e);
          }
        }
        if (tokenResponse != null) {
          // 액세스 토큰 갱신 성공
          String newAccessToken = tokenResponse.data['accessToken'];
          dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          // 원래의 요청을 다시 시도
          return handler.resolve(await dio.request(requestOptions.path, options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
            contentType: requestOptions.contentType,
            responseType: requestOptions.responseType,
          )));
        }
      }
      return handler.next(e); // 에러를 계속 진행
    },
  );
}
