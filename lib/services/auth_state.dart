import 'package:flutter/foundation.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

// mengelola status sesi dan token autentikasi di dalam memori aplikasi
class AuthState extends ChangeNotifier {
  AuthState(this._apiClient, {String? initialToken}) : _token = initialToken;

  final ApiClient _apiClient;
  String? _token;

  String? get token => _token;
  bool get isLoggedIn => _token != null;

  // melakukan login dan menyimpan token yang diterima
  Future<void> login(String username, String password) async {
    _token = await _apiClient.obtainToken(username, password);
    notifyListeners();
  }

  // melakukan logout dengan mencabut token di server dan mengosongkan token lokal
  Future<void> logout() async {
    final current = _token;
    if (current == null) return;

    try {
      await _apiClient.logout(token: current);
    } on ApiException {
      // tetap lanjutkan pembersihan sesi lokal meski request ke server gagal
    } finally {
      _token = null;
      notifyListeners();
    }
  }
}
