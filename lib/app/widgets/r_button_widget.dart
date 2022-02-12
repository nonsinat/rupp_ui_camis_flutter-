// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final Function()? onPressed;

  const RButtonWidget({Key? key, this.backgroundColor, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onPressed,
      child: Text(
        title.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
          fontFamily: "Manrope",
        ),
      ),
    );
  }
}
