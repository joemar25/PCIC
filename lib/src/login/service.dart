// file: login/service.dart
import '../auth/service.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    // Implement the sign up logic here
    // For example, make an API call to create a new user account
    // await apiService.signUp(username, email, password);

    // Dummy implementation for demonstration purposes
    await Future.delayed(const Duration(seconds: 2));

    // Set the token upon successful signup
    AuthService.setToken('dummy_token');

    return true;
  }
}
