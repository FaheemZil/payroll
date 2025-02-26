import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/data/models/login/login.dart';
import 'package:myapp/services/api_endpoints/auth_endpoints.dart';
import 'package:myapp/utils/helpers/dio_helper.dart';

class AuthService {
  final Dio dio;
  AuthService(this.dio);

  Future<Response> registerAsGuest(String username) async {
    final response = await dio.post(
      AuthApiEndpoints.registerAsGuest,
      data: {'username': username, 'register_from': 2},
    );
    return response;
  }

  Future<Response> registerWithEmail(String email) async {
    final response = await dio.post(
      AuthApiEndpoints.registerWithEmail,
      data: {'username': email},
    );
    return response;
  }

  Future<LoginResponse> login(LoginRequest payload) async {
    final Response response = await dio.post(
      AuthApiEndpoints.login,
      data: payload.toJson(),
    );
    debugPrint('-----------------${response.data}--------------');
    return LoginResponse.fromJson(response.data);
  }

  Future<Response> getLoginDetailsUsingToken() async {
    final response = await dio.get(AuthApiEndpoints.getLoginDetailsUsingToken);
    return response;
  }

  Future<Response> sendEmailOtpOutside(String email, String uuid) async {
    final response = await dio.post(
      AuthApiEndpoints.sendEmailOtp,
      data: {'email': email, 'uuid': uuid},
    );
    return response;
  }

  Future<Response> verifyEmailOutside(String uuid, String emailOtp) async {
    final response = await dio.post(
      AuthApiEndpoints.verifyEmail,
      data: {'uuid': uuid, 'email_otp': emailOtp},
    );
    return response;
  }

  Future<Response> sendEmailOtp(String email) async {
    final response = await dio.post(
      AuthApiEndpoints.sendEmailOtp,
      data: {'email': email},
    );
    return response;
  }

  Future<Response> verifyEmail(String email, String otp) async {
    final response = await dio.post(
      AuthApiEndpoints.verifyEmail,
      data: {'email': email, 'otp': otp},
    );
    return response;
  }

  Future<Response> checkUserStatus(String name) async {
    final response = await dio.hideMessage.post(
      AuthApiEndpoints.userStatus,
      data: {"username": name},
    );
    return response;
  }
}
