import 'package:flutter/cupertino.dart';
import 'package:tick2do/api/firebase_api.dart';
import 'package:tick2do/model/task.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks=[];

  List<Task> get tasks =>_tasks.where((task) =>task.isDone==false).toList();

  List<Task> get completedTasks =>
  _tasks.where((task) =>task.isDone==true).toList();

  //for displaying items from firebase to the app
  void setTask(List<Task> tasks) =>
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tasks=tasks;
      notifyListeners();
    });



  void addTask(Task task) => FirebaseApi.createTask(task);

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  toggleTodoStatus(Task task) {
    task.isDone= !task.isDone;
    notifyListeners();
    return task.isDone;

  }

  void updateTask(Task task, String title, String description) {
    task.title=title;
    task.description=description;
    notifyListeners();
  }







}