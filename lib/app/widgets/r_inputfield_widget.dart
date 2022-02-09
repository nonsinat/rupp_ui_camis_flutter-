// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validation;
  final bool? obscureText;
  const InputFieldWidget(
      {Key? key,
      required this.controller,
      this.hintText,
      this.validation,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Manrope",
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC7C9D9)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC7C9D9)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffC7C9D9)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
       
      ),
      validator: validation,
      
    );
  }
}
