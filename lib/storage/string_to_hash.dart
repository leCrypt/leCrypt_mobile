import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pbkdf2_dart/pbkdf2_dart.dart';

String convertStringToHash(String value) {
  var hash = '';
  var gen = PBKDF2(hash: sha1);
  var key = gen.generateKey(value, 'salt', 1000, 16);
  for (var a in key) {
    hash += a.toRadixString(16);
  }
  return hash;
}

String encryptToAES(String value) {
  final key = Key.fromUtf8('my 32 length key................');
  final encrypter = Encrypter(AES(key));
  final iv = IV.fromLength(16);
  final encrypted = encrypter.encrypt(value, iv: iv);
  print(encrypted.base64);
  return encrypted.toString();
}

String decryptFromAES(String value) {
  final key = Key.fromUtf8('adminadminadmin');
  final encrypter = Encrypter(AES(key));
  final decrypted = encrypter.decrypt64(
    value,
  );
  return decrypted;
}
