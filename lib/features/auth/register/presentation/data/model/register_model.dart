class RegisterResponseModel {
  final String message;
  final String? token;

  RegisterResponseModel({required this.message, this.token});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'] ?? '',
      token: json['token'],
    );
  }
}