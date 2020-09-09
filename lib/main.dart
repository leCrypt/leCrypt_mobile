import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/ui/home_page.dart';
import 'package:leCrypt_mobile/values/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'leCrypt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: purplePrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
