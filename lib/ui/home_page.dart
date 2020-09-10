import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/values/colors.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("${AppBar().preferredSize.height / size.height} * 100");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: CustomAppBar(
          title: "leCrypt",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            ind = index;
          });
        },
        currentIndex: ind,
        unselectedItemColor: Colors.black87,
        selectedItemColor: purplePrimary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
            ),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: "Passwords",
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [],
      ),
    );
  }
}
