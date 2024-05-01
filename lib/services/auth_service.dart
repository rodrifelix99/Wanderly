import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthService extends GetxService {
  final Logger _logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();

  Future<void> signIn(String provider) async {
    try {
      switch (provider) {
        case 'google':
          await _signInWithGoogle();
          break;
        case 'apple':
          await _signInWithApple();
          break;
        default:
          throw Exception('Provider not implemented');
      }
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }

  Future<void> _signInWithGoogle() async {
    final googleProvider = GoogleAuthProvider();
    await _auth.signInWithProvider(googleProvider);
  }

  Future<void> _signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    await _auth.signInWithProvider(appleProvider);
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }
}