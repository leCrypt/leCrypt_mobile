import 'dart:convert';

Hashpassword hashpasswordFromJson(String str) =>
    Hashpassword.fromJson(json.decode(str));

String hashpasswordToJson(Hashpassword data) => json.encode(data.toJson());

class Hashpassword {
  Hashpassword({
    this.hash,
  });

  String hash;

  factory Hashpassword.fromJson(Map<String, dynamic> json) => Hashpassword(
        hash: json['hash'],
      );

  Map<String, dynamic> toJson() => {
        'hash': hash,
      };
}
