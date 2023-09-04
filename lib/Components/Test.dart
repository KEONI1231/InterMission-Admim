import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // 요청 전에 실행될 코드
      return handler.next(options); // 요청을 계속 진행
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) {
      // 응답 후에 실행될 코드
      return handler.next(response); // 응답을 계속 진행
    },
    onError: (DioError e, ErrorInterceptorHandler handler) async {
      if (e.response?.statusCode == 401) {
        // 액세스 토큰이 만료된 경우

        RequestOptions requestOptions = e.requestOptions;

        // RequestOptions를 Options로 변환
        Options options = Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
          contentType: requestOptions.contentType,
          responseType: requestOptions.responseType,
          // 필요한 다른 속성들도 여기에 추가
        );

        // 리프레쉬 토큰을 사용하여 액세스 토큰을 다시 받아옴
        Response response = await dio.post('your_refresh_token_endpoint');

        if (response.statusCode == 200) {
          // 액세스 토큰 갱신 성공
          dio.options.headers['Authorization'] = 'Bearer ${response.data['accessToken']}';
          return dio.request(requestOptions.path, options: options)
              .then((_) {}); // 반환 타입을 Future<void>로 변경
        } else {
          // 리프레쉬 토큰도 만료된 경우
          // 로그아웃 로직 실행
        }
      }
      return handler.next(e); // 에러를 계속 진행
    },
  ));

  // 유저의 장바구니 정보를 불러오는 함수
  Future<void> fetchUserCart() async {
    try {
      Response response = await dio.get('your_cart_endpoint');
      // 장바구니 정보 처리 로직
      print(response.data);
    } catch (e) {
      // 에러 처리 로직 (인터셉터에서 대부분 처리됨)
      print(e);
    }
  }

  // 장바구니 정보를 불러옴
  await fetchUserCart();
}
