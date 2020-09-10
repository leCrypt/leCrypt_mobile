import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/values/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomTextField({this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 6),
        boxShadow: [
          BoxShadow(
            color: purpleAccent,
            offset: Offset(7, 7),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        style: TextStyle(
          fontSize: 22,
        ),
        cursorColor: purplePrimary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 22,
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
      ),
    );
  }
}
