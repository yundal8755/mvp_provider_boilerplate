import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  // 1) 싱글톤 인스턴스 생성
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  // 2) Dio 객체 선언
  late Dio dio;
  late CookieJar cookieJar;

  // 3) private 생성자
  ApiService._internal() {
    _init();
  }

  // 4) 초기화 로직
  Future<void> _init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://example.com', // 여기에 실제 baseUrl을 넣어줘
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // CookieJar 설정
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/cookies.json';
    cookieJar = PersistCookieJar(storage: FileStorage(path));

    // Interceptor 등록
    dio.interceptors.clear();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 요청 시 로깅 등 추가 작업
          // print('[REQUEST] ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 응답 시 로깅 등 추가 작업
          // print('[RESPONSE] ${response.statusCode} => ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          // 에러 시 공통 처리
          // print('[ERROR] ${error.response?.statusCode} => ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }

  // 5) 각종 method 공통화
  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> postRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> putRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> patchRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> deleteRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // 6) 토큰(쿠키) 제거 등의 공통 유틸도 여기서 제공
  Future<void> removeCookie() async {
    await cookieJar.deleteAll();
  }
}
