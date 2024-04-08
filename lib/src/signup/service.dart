// file: signup/service.dart
import '../auth/service.dart';

class SignUpService {
  Future<bool> signUp(String username, String email, String password) async {
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
