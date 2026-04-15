import 'dart:convert';

import 'package:equatable/equatable.dart';

class DogModel extends Equatable{
  DogModel({
  required this.id,
   required this.url,
    required this.width,
    required this.height,
  });
  final String id;
  final String url;
  final int width;
  final int height;

   factory DogModel.fromJson(Map<String, dynamic> json){
    return DogModel(id: json["id"], url: json["url"], width: json["width"], height: json["height"],);
   }

  @override
  // TODO: implement props
  List<Object?> get props => [id,url,width,height];
}