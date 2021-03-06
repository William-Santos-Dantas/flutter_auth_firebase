import '../../repositories/login/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;
  LoginServiceImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @override
  Future<UserCredential> loginWithGoogle() =>
      _loginRepository.loginWithGoogle();

  @override
  Future<void> logout() => _loginRepository.logout();

  @override
  Future<UserCredential> loginWithEmail(
          {required String email, required String password}) =>
      _loginRepository.loginWithEmail(email: email, password: password);

  @override
  Future<UserCredential> registerWithEmail(
          {required String email,
          required String password,
          required String name}) =>
      _loginRepository.registerWithEmail(
          email: email, password: password, name: name);
}
