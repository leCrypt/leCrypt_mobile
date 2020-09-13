import 'dart:io';

import 'package:leCrypt_mobile/models/hash.dart';
import 'package:path_provider/path_provider.dart';

import 'string_to_hash.dart';

class HashStorage {
  Future<File> getHashFile() async {
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/hash.json');
    if (!(await file.exists())) {
      await file.create().then((value) {
        value.writeAsString(
          hashpasswordToJson(
            Hashpassword(hash: ''),
          ),
        );
      });
    }
    return file;
  }

  Future<String> getHash(String key) async {
    var file = await getHashFile();
    var contents = await file.readAsString();
    var _hash = hashpasswordFromJson(contents);
    return _hash.hash;
  }

  Future<void> deleteHash(String key) async {
    await (await getHashFile()).delete();
  }

  Future<void> writeHash(String key, String value) async {
    var hashValue = convertStringToHash(value);
    var file = await getHashFile();
    await file.writeAsString(
      hashpasswordToJson(
        Hashpassword(hash: hashValue),
      ),
    );
  }
}
