

class LoginResponseModel {
  final String message;
  final String? token;

  LoginResponseModel({required this.message, this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] ?? '',
      token: json['token'],
    );
  }
}