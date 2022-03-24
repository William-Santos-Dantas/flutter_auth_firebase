import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildMenuBar extends StatelessWidget {
  final VoidCallback onSignInPress;
  final VoidCallback onSignUpPress;
  final bool existing;

  const BuildMenuBar({Key? key, required this.onSignInPress, required this.onSignUpPress, required this.existing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthTransformer(reducedBy: 10),
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: onSignInPress,
                child: Text(
                  "Existing",
                  style: TextStyle(
                    color: existing ? Colors.black : Colors.white,
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold",
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: onSignUpPress,
                child: Text(
                  "New",
                  style: TextStyle(
                    color: existing ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontFamily: "WorkSansSemiBold",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
