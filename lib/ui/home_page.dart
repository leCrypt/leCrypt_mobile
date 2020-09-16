import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/storage/string_to_hash.dart';
import 'package:leCrypt_mobile/ui/notes_page.dart';
import 'package:leCrypt_mobile/ui/password_page.dart';
import 'package:leCrypt_mobile/values/colors.dart';
import 'package:leCrypt_mobile/widgets/addNoteWidget.dart';
import 'package:leCrypt_mobile/widgets/addPasswordWidgete.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customSearchBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var page = [NotesPage(), PasswordPage()];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    encrypt();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: Center(
          child: CustomAppBar(
            title: 'leCrypt',
            bottom: CustomSearchBar(
              hint: 'Search',
              onTap: () {},
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        unselectedItemColor: Colors.black87,
        selectedItemColor: purplePrimary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
            ),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Passwords',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          if (pageIndex == 0) {
            showAddNoteDialog(context);
          }else{
            showAddPasswordDialog(context);
          }
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: page[pageIndex],
    );
  }
}
