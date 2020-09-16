import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget bottom;

  CustomAppBar({
    this.title,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.08),
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.03),
            child: bottom,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 34,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}
