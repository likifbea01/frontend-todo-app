// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
    Todo({
       required this.data,
      required  this.message,
    });

    List<Datum> data;
    String message;

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
      required  this.id,
      required  this.title,
     required   this.body,
      required  this.status,
      required  this.endDate,
       required this.v,
    });

    String id;
    String title;
    String body;
    bool status;
    DateTime endDate;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        body: json["body"],
        status: json["status"],
        endDate: DateTime.parse(json["endDate"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "body": body,
        "status": status,
        "endDate": endDate.toIso8601String(),
        "__v": v,
    };
}
