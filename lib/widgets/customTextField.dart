import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/values/values.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final int maxLines;
  final TextInputType textInputType;

  CustomTextField({
    this.controller,
    this.obscure = false,
    this.hintText,
    this.maxLines = 1,
    this.textInputType = TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: purpleAccent,
            offset: Offset(7, 7),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        maxLines: maxLines,
        keyboardType: textInputType,
        cursorColor: purplePrimary,
        style: TextStyle(
          fontSize: 22,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          hintStyle: TextStyle(fontSize: 22),
          focusedBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          border: outlineInputBorder,
          disabledBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
