import 'dart:convert';

Passwords passwordsFromJson(String str) => Passwords.fromJson(json.decode(str));

String passwordsToJson(Passwords data) => json.encode(data.toJson());

class Passwords {
  Passwords({
    this.passes,
  });

  List<Pass> passes;

  factory Passwords.fromJson(Map<String, dynamic> json) => Passwords(
        passes: List<Pass>.from(json['passes'].map((x) => Pass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'passes': List<dynamic>.from(passes.map((x) => x.toJson())),
      };
}

class Pass {
  Pass({
    this.password,
    this.username,
    this.website,
  });

  String password;
  String username;
  String website;

  factory Pass.fromJson(Map<String, dynamic> json) => Pass(
        password: json['password'],
        username: json['username'],
        website: json['website'],
      );

  Map<String, dynamic> toJson() => {
        'password': password,
        'username': username,
        'website': website,
      };
}
