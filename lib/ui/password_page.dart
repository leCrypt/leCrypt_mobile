import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:leCrypt_mobile/storage/password_storage.dart';
import 'package:leCrypt_mobile/values/values.dart';
import 'package:leCrypt_mobile/widgets/passwordListItem.dart';
import 'package:provider/provider.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  void didChangeDependencies() {
    setList(context);
    super.didChangeDependencies();
  }

  void setList(BuildContext context) async {
    final provider = Provider.of<AppProvider>(context);
    provider.setPasswordList(await PasswordStorage().getPasswords());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    if (provider.passwordList != null) {
      final list = provider.isSearchingList
          ? provider.searchPassList
          : provider.passwordList;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return PasswordItem(
            key: Key(list[index].website),
            index: index,
            website: list[index].website,
            username: list[index].username,
            password: list[index].password,
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: purplePrimary,
        ),
      );
    }
  }
}
