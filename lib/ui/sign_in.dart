import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/ui/login.dart';
import 'package:leCrypt_mobile/ui/register.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customFlatButton.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(
          title: "leCrypt",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/inv.png',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRaisedButton(
                title: "Register",
                width: size.width * 0.35,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Register();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              CustomRaisedButton(
                title: "Login",
                width: size.width * 0.35,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
