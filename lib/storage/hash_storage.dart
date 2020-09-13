import 'dart:io';

import 'package:leCrypt_mobile/models/hash.dart';
import 'package:path_provider/path_provider.dart';

import 'string_to_hash.dart';

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
}
