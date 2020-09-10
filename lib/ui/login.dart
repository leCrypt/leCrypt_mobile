import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customFlatButton.dart';
import 'package:leCrypt_mobile/widgets/customTextField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController serverController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: CustomAppBar(
          title: "Login",
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
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomTextField(
              hintText: "XXX.XXX.XXX.XXX",
              controller: serverController,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hintText: "Token",
              controller: tokenController,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hintText: "Password",
              controller: passwordController,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomRaisedButton(
              onTap: () {},
              title: "Submit",
              topPadding: 10,
              fontSize: 20,
              width: size.width * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
