import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customFlatButton.dart';
import 'package:leCrypt_mobile/widgets/customTextField.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(
          title: "Register",
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/inv.png',
              height: size.width * 0.50,
              width: size.width * 0.50,
            ),
            CustomTextField(
              hintText: "Password",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hintText: "Confirm Password",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomRaisedButton(
              onTap: () {},
              title: "Submit",
              topPadding: 10,
              offset: 6,
              fontSize: 20,
              width: size.width * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
