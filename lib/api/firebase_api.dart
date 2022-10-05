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

  static Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('task')
      .orderBy(TaskField.cratedTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Task.fromJson));

}