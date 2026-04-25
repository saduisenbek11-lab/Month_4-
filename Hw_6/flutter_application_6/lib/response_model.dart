import 'package:equatable/equatable.dart';

class PostResponseModel extends Equatable {
  final int? userId;
  final int? id;
  final String? title; 
  final String? body;

  const PostResponseModel({this.userId, this.id, this.title, this.body});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'title': title, 'body': body, 'id': id};
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}