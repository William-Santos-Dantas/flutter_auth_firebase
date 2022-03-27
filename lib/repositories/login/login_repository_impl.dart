import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserCredential> loginWithGoogle() async{
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if(googleAuth != null){
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Erro ao realizar login com o google');
  }

  Future<UserCredential> loginWithEmail({required String email, required String password}){
    
  }

  @override
  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }


}