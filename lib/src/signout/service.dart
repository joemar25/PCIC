// file: signout/service.dart
import 'package:firebase_auth/firebase_auth.dart';

class SignOutService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signout() async {
    await _auth.signOut();
  }
}
