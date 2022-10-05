import 'package:flutter/cupertino.dart';
import 'package:tick2do/utils.dart';

class TaskField{
  static const cratedTime='createTime';
}

class Task{

  DateTime cratedTime;
  String title;
  String id;
  String description;
  bool isDone;

  Task({
    required this.cratedTime,
    required this.title,
    this.description='',
     this.id='',
    this.isDone=false,
});
  static Task fromJson(Map<String, dynamic> json) => Task(
    cratedTime: Utils.toDateTime(json['cratedTime']) as DateTime,
    title: json['title'],
    description: json['description'],
    id: json['id'],
    isDone: json['isDone'],
  );
  Map<String, dynamic> toJson() => {
    'createTime': Utils.fromDateTimeToJson(cratedTime),
    'title': title,
    'description': description,
    'id': id,
    'isDone': isDone,


  };

}