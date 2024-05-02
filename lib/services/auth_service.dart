import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService extends GetxService {
  final Logger _logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStream => _auth.authStateChanges();
  User? get user => _auth.currentUser;

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
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  Future<void> _signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    await _auth.signInWithCredential(credential);
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