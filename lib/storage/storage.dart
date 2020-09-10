import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();

  Future<String> getValue(String key) async {
    return await flutterSecureStorage.read(key: key);
  }

  Future<void> deleteValue(String key) async {
    await flutterSecureStorage.delete(key: key);
  }

  Future<void> writeValue(String key, String value) async {
    await flutterSecureStorage.write(key: key, value: value);
  }
}
