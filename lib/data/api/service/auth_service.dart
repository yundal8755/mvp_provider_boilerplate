import 'package:dio/dio.dart';
import 'package:mvp_provider_boilerplate/data/api/api_service.dart';
import 'package:mvp_provider_boilerplate/data/api/model/response_model.dart';

class AuthService {
  final ApiService _api = ApiService();

  /// []
  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = {
        'email': email,
        'password': password,
      };

      // ApiService 의 postRequest 호출
      Response res = await _api.postRequest(
        '/API/auth/login',
        data: data,
      );

      // 원하는 형태의 ResponseModel 변환
      return ResponseModel.fromJson({
        'originJson': res.data,
        'code': res.statusCode,
      });
    } on DioException catch (e) {
      return ResponseModel()
        ..code = e.response?.statusCode
        ..errorMsg = e.message;
    } catch (e) {
      return ResponseModel()
        ..code = -1
        ..errorMsg = e.toString();
    }
  }

  /// []
  Future<ResponseModel> logout() async {
    try {
      Response res = await _api.postRequest('/API/auth/logout');

      return ResponseModel.fromJson({
        'originJson': res.data,
        'code': res.statusCode,
      });
    } on DioException catch (e) {
      return ResponseModel()
        ..code = e.response?.statusCode
        ..errorMsg = e.message;
    } catch (e) {
      return ResponseModel()
        ..code = -1
        ..errorMsg = e.toString();
    }
  }
}
