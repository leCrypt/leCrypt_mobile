import 'dart:convert';

Hash hashFromJson(String str) => Hash.fromJson(json.decode(str));

String hashToJson(Hash data) => json.encode(data.toJson());

class Hash {
  Hash({
    this.hash,
  });

  String hash;

  factory Hash.fromJson(Map<String, dynamic> json) => Hash(
        hash: json['hash'],
      );

  Map<String, dynamic> toJson() => {
        'hash': hash,
      };
}
