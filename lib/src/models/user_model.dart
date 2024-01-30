import 'dart:convert';

class UserModel {
    final String name;
    final String password;

    UserModel({
        required this.name,
        required this.password,
    });

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? "",
        password: json["password"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
    };
}
