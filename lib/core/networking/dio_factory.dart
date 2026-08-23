import 'package:dio/dio.dart';

class ApiManager {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://route-ecommerce.onrender.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
