import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/password.dart';
import 'package:leCrypt_mobile/storage/password_storage.dart';
import 'package:leCrypt_mobile/widgets/customTextField.dart';

import 'customFlatButton.dart';

void showAddPasswordDialog(BuildContext context) {
  var websiteContoller = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Password'),
        actions: [
          CustomRaisedButton(
            title: 'Cancel',
            topPadding: 10,
            width: 80,
            fontSize: 16,
            offset: 4,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          CustomRaisedButton(
            title: 'Add',
            topPadding: 10,
            width: 80,
            fontSize: 16,
            offset: 4,
            onTap: () {
              PasswordStorage().addPassword(
                Pass(
                  username: userNameController.text,
                  website: websiteContoller.text,
                  password: passwordController.text,
                ),
                context,
              );
              Navigator.pop(context);
            },
          ),
        ],
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hintText: 'Website',
                controller: websiteContoller,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'User Name',
                controller: userNameController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Password',
                obscure: true,
                controller: passwordController,
              ),
            ],
          ),
        ),
      );
    },
  );
}
