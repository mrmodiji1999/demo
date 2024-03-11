// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PostDataModel> welcomeFromJson(String str) => List<PostDataModel>.from(json.decode(str).map((x) => PostDataModel.fromJson(x)));

String welcomeToJson(List<PostDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostDataModel {
    int postId;
    int id;
    String name;
    String email;
    String body;

    PostDataModel({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
