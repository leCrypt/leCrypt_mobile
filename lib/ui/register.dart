import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/storage/storage.dart';
import 'package:leCrypt_mobile/ui/home_page.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customFlatButton.dart';
import 'package:leCrypt_mobile/widgets/customTextField.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: CustomAppBar(
          title: 'Register',
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
              hintText: 'Password',
              controller: passwordController,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            CustomRaisedButton(
              title: 'Submit',
              topPadding: 10,
              fontSize: 20,
              width: size.width * 0.25,
              onTap: () async {
                if (checkPasswords()) {
                  await Storage().writeValue('password', passwordController.text);
                  Navigator.pop(context);
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                }
              },
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
      snackBar('Password should be of 8 atleast');
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      snackBar("Password don\'t match");
      return false;
    }
    return true;
  }
}
