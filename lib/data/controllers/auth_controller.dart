import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/utils/helpers/dio_helper.dart';

class AuthController extends GetxController {
  String? _token;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final authService = AuthService(client);
  bool isNewuser = true;

  String? get token => _token;

  // static AuthController get auth => Get.find<AuthController>();

  Future<void> userStatus(String name) async {
    try {
      await AuthService(client).checkUserStatus(name);

      isNewuser = true;
    } catch (e) {
      debugPrint('------------------hellooo----------');
      isNewuser = false;
      update();
    }
  }

  Future<void> saveToken(String newToken) async {
    await _storage.write(key: 'auth_token', value: newToken);
  }

  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
  }

  @override
  void onInit() {
    _storage.read(key: 'auth_token').then((value) {
      _token = value;
    });
    super.onInit();
  }
}
