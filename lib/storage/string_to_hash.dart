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
  
  final key = Key.fromBase64('t6DGmN2z7+z9Snwu9cnf8rYHfntXV3kqiQ9F0bee8D4=');
  final encrypter = Encrypter(AES(key));
  final encrypted = encrypter.encrypt(
    value,
    iv: IV.fromBase64('VBVeAgeA5WIo5zj2gxKpWA=='),
  );
  print(encrypted.base64);
  return encrypted.base64;
}

String decryptFromAES(String value) {
  final key = Key.fromBase64('t6DGmN2z7+z9Snwu9cnf8rYHfntXV3kqiQ9F0bee8D4=');
  final encrypter = Encrypter(
    AES(
      key,
      mode: AESMode.cbc,
    ),
  );
  final decrypted = encrypter.decrypt64(
    value,
    iv: IV.fromBase64('VBVeAgeA5WIo5zj2gxKpWA=='),
  );
  return decrypted;
}
