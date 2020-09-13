import 'package:crypto/crypto.dart';
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
