
// lib/services/auth_service.dart
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends GetxService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> get token async => await _storage.read(key: 'auth_token');

  bool get hasToken => token != null;

  Future<void> saveToken(String newToken) async {
    await _storage.write(key: 'auth_token', value: newToken);
  }

  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
  }
}