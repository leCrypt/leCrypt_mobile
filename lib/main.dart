import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:leCrypt_mobile/storage/hash_storage.dart';
import 'package:leCrypt_mobile/ui/home_page.dart';
import 'package:leCrypt_mobile/ui/login/sign_in.dart';
import 'package:leCrypt_mobile/values/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
      title: 'leCrypt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: purplePrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: HashStorage().getHash('password'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return HomePage();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}
