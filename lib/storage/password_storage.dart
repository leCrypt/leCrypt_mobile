import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:leCrypt_mobile/models/password.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pbkdf2_dart/pbkdf2_dart.dart';

class PasswordStorage {
  Future<List<Pass>> getPasswords() async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/passes.json');
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
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/passes.json');
    var exist = await file.exists();
    if (!exist) {
      await file.create().then((value) {
        value.writeAsString(
          passwordsToJson(Passwords(passes: passes)),
        );
      });
    } else {
      await file.writeAsString(
        passwordsToJson(Passwords(passes: passes)),
      );
    }
  }

  Future<void> addNote(String website, String username, String password) async {
    var notes = await getPasswords();
    notes.add(
      Pass(
        website: convertStringToHash(website),
        username: convertStringToHash(username),
        password: convertStringToHash(password),
      ),
    );
    await writePassword(notes);
  }

  String convertStringToHash(String value) {
    var hash = '';
    var gen = PBKDF2(hash: sha1);
    var key = gen.generateKey(value, 'salt', 1000, 16);
    for (var a in key) {
      hash += a.toRadixString(16);
    }
    return hash;
  }
}
