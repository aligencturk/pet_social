import 'dart:io';

import 'package:logger/logger.dart';

import 'api_client.dart';

class AuthService {
  AuthService({ApiClient? apiClient, Logger? logger})
    : _api = apiClient ?? ApiClient(),
      _logger = logger ?? Logger();

  final ApiClient _api;
  final Logger _logger;

  Future<RegisterResponse> register({
    required String userFirstname,
    required String userLastname,
    required String userEmail,
    required String userPhone,
    required String userPassword,
    required bool policy,
    required bool kvkk,
  }) async {
    final Map<String, dynamic> payload = {
      'userFirstname': userFirstname,
      'userLastname': userLastname,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'userPassword': userPassword,
      'version': '1.0.0',
      'platform': Platform.isIOS ? 'ios' : 'android',
      'policy': policy,
      'kvkk': kvkk,
    };

    final Map<String, dynamic> json = await _api.postJson(
      'service/auth/register',
      payload,
    );

    _logger.i('register response parsed');
    return RegisterResponse.fromJson(json);
  }
}

class RegisterResponse {
  RegisterResponse({
    required this.error,
    required this.success,
    required this.successMessage,
    required this.data,
  });

  final bool error;
  final bool success;
  final String? successMessage;
  final RegisterData? data;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      error: json['error'] == true,
      success: json['success'] == true,
      successMessage: json['success_message'] as String?,
      data: json['data'] is Map<String, dynamic>
          ? RegisterData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class RegisterData {
  RegisterData({
    required this.userId,
    required this.userToken,
    required this.codeToken,
  });

  final int? userId;
  final String? userToken;
  final String? codeToken;

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      userId: (json['userID'] as num?)?.toInt(),
      userToken: json['userToken'] as String?,
      codeToken: json['codeToken'] as String?,
    );
  }
}
