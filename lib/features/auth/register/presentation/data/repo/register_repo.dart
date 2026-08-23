import 'package:dio/dio.dart';
import '../model/register_model.dart';

class RegisterRepo {
  final Dio dio;

  RegisterRepo({required this.dio});

  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signup', 
        data: {
          'name': name,
          'email': email,
          'password': password,
          'rePassword': rePassword,
          'phone': phone,
        },
      );
      return RegisterResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'error';
    }
  }
}