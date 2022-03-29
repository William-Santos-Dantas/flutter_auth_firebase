import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/ui/loader/loader_mixin.dart';
import '../../application/ui/messages/messages_mixin.dart';
import '../../services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  PageController pageController = PageController();
  final _existing = false.obs;
  get existing => _existing.value;
  set existing(value) => _existing.value = value;

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {}

  void onSignInPress() {
    _existing(false);
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void onSignUpPress() {
    _existing(true);
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void signInWithEmail(
      {required String email, required String password}) async {
    try {
      loading(true);
      await _loginService.loginWithEmail(email: email, password: password);
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login Realizado com Sucesso'));
    } catch (e) {
      loading(false);
      message(MessageModel.error(
          title: 'Login Error', message: 'Erro ao Realizar Login'));
    }
  }

  void signInWithGoogle() async {
    try {
      loading(true);
      await _loginService.loginWithGoogle();
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login Realizado com Sucesso'));
    } catch (e) {
      loading(false);
      message(MessageModel.error(
          title: 'Login Error', message: 'Erro ao Realizar Login'));
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      loading(true);
      await _loginService.registerWithEmail(
        email: email,
        password: password,
        name: name,
      );
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Cadastro Realizado com Sucesso'));
    } catch (e) {
      loading(false);
      message(MessageModel.error(
          title: 'Register Error', message: 'Erro ao Realizar Cadastro'));
    }
  }
}
