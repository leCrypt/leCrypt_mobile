import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:leCrypt_mobile/ui/notes_page.dart';
import 'package:leCrypt_mobile/ui/password_page.dart';
import 'package:leCrypt_mobile/values/colors.dart';
import 'package:leCrypt_mobile/widgets/addNoteWidget.dart';
import 'package:leCrypt_mobile/widgets/addPasswordWidgete.dart';
import 'package:leCrypt_mobile/widgets/customAppBar.dart';
import 'package:leCrypt_mobile/widgets/customSearchBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var page = [NotesPage(), PasswordPage()];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: Center(
          child: CustomAppBar(
            title: 'leCrypt',
            bottom: CustomSearchBar(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.pageIndex,
        unselectedItemColor: Colors.black87,
        selectedItemColor: purplePrimary,
        onTap: (index) {
          provider.setPageIndex(1 - provider.pageIndex);
          provider.setSearchNoteList([]);
          provider.setSearchPassList([]);
          provider.setIsSearchingList(false);
        },
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
          if (provider.pageIndex == 0) {
            showAddNoteDialog(context);
          } else {
            showAddPasswordDialog(context);
          }
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: page[provider.pageIndex],
    );
  }
}
