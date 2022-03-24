import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const SubmitButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthTransformer(reducedBy: 20),
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
          ),
          BoxShadow(
            color: Colors.blue,
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.yellow,
            Colors.green,
          ],
          begin: FractionalOffset(0.2, 0.2),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.white,
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              text,
              style:const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: "WorkSansBold",
              ),
              maxLines: 1,
            ),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
