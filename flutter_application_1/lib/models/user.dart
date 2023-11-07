// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  List<UserElement>? users;
  List<ListElement>? list;

  User({
    this.users,
    this.list,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: json["users"] == null
            ? []
            : List<UserElement>.from(
                json["users"]!.map((x) => UserElement.fromJson(x))),
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  int? id;
  String? name;
  String? building;
  String? roomNumber;
  String? bedNumber;
  String? type;
  String? time;

  ListElement({
    this.id,
    this.name,
    this.building,
    this.roomNumber,
    this.bedNumber,
    this.type,
    this.time,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        building: json["building"],
        roomNumber: json["room_number"],
        bedNumber: json["bed_number"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "building": building,
        "room_number": roomNumber,
        "bed_number": bedNumber,
        "type": type,
        "time": time,
      };
}

class UserElement {
  int? id;
  String? email;
  String? password;

  UserElement({
    this.id,
    this.email,
    this.password,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
      };
}
