import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import 'custom_text_field.dart';
import 'submit_button.dart';

class BuildSignIn extends StatelessWidget {

  final VoidCallback signInWithEmail;
  final VoidCallback signInWithGoogle;
  const BuildSignIn({Key? key, required this.signInWithEmail, required this.signInWithGoogle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: context.widthTransformer(reducedBy: 10),
                  child: Column(
                    children: <Widget>[
                      const CustomTextField(
                        inputType: TextInputType.emailAddress,
                        hintText: "Email Address",
                        icon: Icons.email,
                      ),
                      Divider(
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      const CustomTextField(
                        inputType: TextInputType.emailAddress,
                        hintText: "Password",
                        icon: Icons.email,
                        password: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SubmitButton(
            onPress: signInWithEmail,
            text: 'LOGIN',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: "WorkSansMedium",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white10,
                        Colors.white,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "WorkSansMedium",
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white10,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.widthTransformer(reducedBy: 20),
            height: 42,
            child: SignInButton(
              Buttons.Google,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              text: "Sign up with Google",
              onPressed: signInWithGoogle,
            ),
          ),
        ],
      ),
    );
  }
}
