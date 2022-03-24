import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../application/ui/widgets/build_menu_bar.dart';
import '../../application/ui/widgets/build_sign_in.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height >= 775.0 ? Get.height : 775.0,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.red,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Image(
                  width: 250.0,
                  height: 191.0,
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/login.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Obx(
                    () => BuildMenuBar(
                      existing: controller.existing,
                      onSignInPress: controller.onSignInPress,
                      onSignUpPress: controller.onSignUpPress,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      BuildSignIn(signInWithEmail: controller.signInWithEmail, signInWithGoogle: controller.signInWithGoogle),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
