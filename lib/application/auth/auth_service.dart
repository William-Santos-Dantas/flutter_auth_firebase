import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  User? user;

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;
      if (user == null) {
        Get.offAllNamed('/');
      } else {
        Get.offAllNamed('/home');
      }
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
