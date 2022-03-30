import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'custom_text_field.dart';
import 'submit_button.dart';

class BuildSignUp extends StatelessWidget {
  final Function registerWithEmail;
  const BuildSignUp({Key? key, required this.registerWithEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmpasswordController =
        TextEditingController();
    final _formKey = GlobalKey<FormState>();


    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Stack(
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
                        CustomTextField(
                          inputType: TextInputType.text,
                          hintText: "Name",
                          icon: Icons.person,
                          controller: nameController,
                          validator: Validatorless.required(
                            'Nome Obrigatório',
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        CustomTextField(
                          inputType: TextInputType.emailAddress,
                          hintText: "Email Address",
                          icon: Icons.email,
                          controller: emailController,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório'),
                            Validatorless.email('E-mail invalido'),
                          ]),
                        ),
                        Divider(
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        CustomTextField(
                          inputType: TextInputType.emailAddress,
                          hintText: "Password",
                          icon: Icons.lock,
                          password: true,
                          controller: passwordController,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatório'),
                            Validatorless.min(
                                6, 'Senha deve conter pelo menos 6 caracteres'),
                          ]),
                        ),
                        Divider(
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        CustomTextField(
                          inputType: TextInputType.text,
                          hintText: "Confirm Password",
                          icon: Icons.lock,
                          password: true,
                          controller: confirmpasswordController,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('Senha Obrigatório'),
                              Validatorless.min(6,
                                  'Senha deve conter pelo menos 6 caracteres'),
                              Validatorless.compare(passwordController,
                                  'Senhas diferente de confirma senha')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SubmitButton(
            onPress: () {
              if (_formKey.currentState!.validate()) {
                registerWithEmail(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
            text: 'REGISTER',
          ),
        ],
      ),
    );
  }
}
