import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserCredential> loginWithGoogle();
  Future<UserCredential> loginWithEmail({required String email, required String password});

  Future<void> logout() async{}
}