// To parse this JSON data, do
//
//     final testing = testingFromJson(jsonString);

import 'dart:convert';

Testing testingFromJson(String str) => Testing.fromJson(json.decode(str));

String testingToJson(Testing data) => json.encode(data.toJson());

class Testing {
    int userId;
    int id;
    String title;
    bool completed;

    Testing({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory Testing.fromJson(Map<String, dynamic> json) => Testing(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
