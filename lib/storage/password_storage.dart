import 'dart:io';

import 'package:leCrypt_mobile/models/password.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<void> DeletPassword(int index) async {
    var passes = await getPasswords();
    passes.removeAt(index);
    await writePassword(passes);
  }

  Future<void> writePassword(List<Pass> passes) async {
    var file = await getPasswordsFile();
    await file.writeAsString(
      passwordsToJson(
        Passwords(passes: passes),
      ),
    );
  }

  Future<void> addPassword(String website, String username, String password) async {
    var notes = await getPasswords();
    notes.add(
      Pass(
        website: (website),
        username: (username),
        password: (password),
      ),
    );
    print(notes);
    await writePassword(notes);
  }
}