import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:leCrypt_mobile/models/hash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pbkdf2_dart/pbkdf2_dart.dart';

class HashStorage {
  Future<String> getHash(String key) async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/hash.json');
    var contents = await file.readAsString();
    var _hash = hashpasswordFromJson(contents);
    return _hash.hash;
  }

  Future<void> deleteHash(String key) async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/hash.json');
    await file.delete();
  }

  Future<void> writeHash(String key, String value) async {
    var hashValue = convertStringToHash(value);
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/hash.json');
    var exist = await file.exists();
    if (!exist) {
      await file.create().then((value) {
        value.writeAsString(hashpasswordToJson(
          Hashpassword(hash: hashValue),
        ));
      });
    } else {
      await file.writeAsString('{"hash": "$hashValue"}');
    }
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
