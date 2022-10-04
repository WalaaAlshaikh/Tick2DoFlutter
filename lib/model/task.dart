import 'package:flutter/cupertino.dart';

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

}