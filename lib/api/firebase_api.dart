import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tick2do/model/task.dart';
import 'package:tick2do/utils.dart';


class FirebaseApi{
  static Future<String> createTask(Task task) async{
    final docTask= FirebaseFirestore.instance.collection('task').doc();

    task.id=docTask.id;
    await docTask.set(task.toJson());

    return docTask.id;

  }
// this is for reading data from firebase
  static Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('task')
      .orderBy(TaskField.cratedTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Task.fromJson));

  static Future updateTask(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc(task.id);

    await docTask.update(task.toJson());
  }

  static Future deleteTask(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc(task.id);

    await docTask.delete();

  }

}