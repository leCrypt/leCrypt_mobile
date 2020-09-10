import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customFlatButton.dart';
import 'package:leCrypt_mobile/widgets/customTextField.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
              controller: passwordController,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomRaisedButton(
              onTap: () {
                if (checkPasswords()) {}
              },
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

  void snackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  bool checkPasswords() {
    if (passwordController.text.length < 8) {
      snackBar("Password should be of 8 atleast");
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      snackBar("Password don\'t match");
      return false;
    }
    return true;
  }
}
