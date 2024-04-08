import '../auth/service.dart';

class LogoutService {
  Future<void> logout() async {
    // Perform any necessary cleanup or API calls for logging out
    // For example, clear the token in the AuthService
    AuthService.clearToken();
  }
}
