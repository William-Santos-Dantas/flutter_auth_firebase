import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserCredential> loginWithGoogle();
  Future<UserCredential> loginWithEmail({required String email, required String password});
  Future<UserCredential> registerWithEmail({required String email, required String password, required String name});

  Future<void> logout() async{}
}