import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/ui/loader/loader_mixin.dart';
import '../../application/ui/messages/messages_mixin.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  PageController pageController = PageController();
  final _existing = false.obs;
  get existing => _existing.value;
  set existing(value) => _existing.value = value;

  LoginController();

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

  void signInWithEmail() {
    print('sign In With Email');
  }
  void signInWithGoogle() {
    print('sign In With Google');
  }
}
