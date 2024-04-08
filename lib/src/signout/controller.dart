// file: signout/controller.dart
import 'service.dart';
import '../navigation/service.dart';

class SignOutController {
  final SignOutService service;
  final NavigationService navigationService;

  SignOutController({required this.service, required this.navigationService});

  Future<void> signout() async {
    try {
      await service.signout();
      // Navigate to the login or another appropriate screen
      navigationService.navigateTo('/auth');
    } catch (e) {
      // Handle errors, if any
      print('Error during signout: $e');
    }
  }
}
