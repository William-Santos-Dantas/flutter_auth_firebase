import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType inputType;
  final String hintText;
  final IconData icon;
  final bool password;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.inputType,
    required this.hintText,
    required this.icon,
    this.password = false,
    required this.controller,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<CustomTextField> createState() => _CustomTextFieldState(
        hintText: hintText,
        icon: icon,
        inputType: inputType,
        password: password,
        controller: controller,
      );
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextInputType inputType;
  final String hintText;
  final IconData icon;
  final bool password;
  final TextEditingController controller;

  _CustomTextFieldState({
    required this.inputType,
    required this.hintText,
    required this.icon,
    required this.password,
    required this.controller,
  }) : obscureText = password;

  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 25.0,
        right: 25.0,
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: "WorkSansSemiBold",
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            icon,
            size: 22.0,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle:
              const TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),
          suffixIcon: password
              ? GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        obscureText = !obscureText;
                      },
                    );
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    size: 15.0,
                    color: Colors.black,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
