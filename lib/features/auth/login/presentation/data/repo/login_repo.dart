import 'package:dio/dio.dart';
import '../model/login_model.dart';

class LoginRepo {
  final Dio dio;

  LoginRepo({required this.dio});

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signin', 
        data: {
          'email': email,      
          'password': password,
        },
      );
      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'error';
    }
  }
}