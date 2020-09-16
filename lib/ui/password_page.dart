import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/storage/password_storage.dart';
import 'package:leCrypt_mobile/widgets/customSearchBar.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomSearchBar(
            hint: 'Search',
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: PasswordStorage().getPasswords().asStream(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data.length > 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].website),
                      subtitle: Text(snapshot.data[index].username),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No note found!'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
