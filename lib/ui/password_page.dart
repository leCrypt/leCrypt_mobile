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
      return ListView.builder(
        shrinkWrap: true,
        itemCount: provider.passwordList.length,
        itemBuilder: (context, index) {
          return PasswordItem(
            key: Key(provider.passwordList[index].website),
            index: index,
            website: provider.passwordList[index].website,
            username: provider.passwordList[index].username,
            password: provider.passwordList[index].password,
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
