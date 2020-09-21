import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leCrypt_mobile/models/password.dart';
import 'package:leCrypt_mobile/provider/app_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class PasswordStorage {
  Future<File> getPasswordsFile() async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/passes.json');
    if (!(await file.exists())) {
      await file.create().then((value) {
        value.writeAsString(
          passwordsToJson(
            Passwords(passes: []),
          ),
        );
      });
    }
    return file;
  }

  Future<List<Pass>> getPasswords() async {
    var file = await getPasswordsFile();
    var fileContent = await file.readAsString();
    var _passes = passwordsFromJson(fileContent);
    return _passes.passes;
  }

  Future<void> DeletPassword(int index, BuildContext context) async {
    var passes = await getPasswords();
    passes.removeAt(index);
    await writePassword(passes, context);
  }

  Future<void> writePassword(List<Pass> passes, BuildContext context) async {
    var file = await getPasswordsFile();
    await file.writeAsString(
      passwordsToJson(
        Passwords(passes: passes),
      ),
    );
    Provider.of<AppProvider>(context, listen: false).setPasswordList(passes);
  }

  Future<void> addPassword(Pass pass, BuildContext context) async {
    var notes = await getPasswords();
    notes.add(pass);
    print(notes);
    await writePassword(notes, context);
  }
}
