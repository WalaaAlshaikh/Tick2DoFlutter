import 'package:flutter/cupertino.dart';
import 'package:tick2do/model/task.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks=[
    Task(cratedTime: DateTime.now(), title: 'Studying'),
    Task(cratedTime: DateTime.now(), title: "Drawing",
  description: ''' -Lineart
  -Paint
  -Staff''')
  ];

  List<Task> get tasks =>_tasks.where((task) =>task.isDone==false).toList();

}