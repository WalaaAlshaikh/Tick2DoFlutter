import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/model/task.dart';

import '../pages/edit_task_page.dart';
import '../provider/tasks.dart';
import '../utils.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child:Slidable(

      actionPane: SlidableDrawerActionPane(),
      key: Key(task.id),
      actions: [
        IconSlideAction(
          color: Colors.amber,
          onTap: ()=> editTask(context,task),
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.deepOrange,
          caption: 'Delete',
          onTap: () => deleteTask(context,task),
          icon: Icons.delete,

        )
      ],
      child: buildTask(context),
    ),
  );
  

  @override
  Widget buildTask(BuildContext context) => GestureDetector(
    onTap: ()=> editTask(context, task),
    child:  Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: task.isDone,
          onChanged: (_){
            final provider=
            Provider.of<TaskProvider>(context, listen: false);
            final isDone= provider.toggleTodoStatus(task);

            Utils.showSnackBar(
              context,
              isDone ? 'Task completed' : 'Task marked uncompleted', );
          },
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if(task.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    task.description,
                    style: TextStyle(fontSize: 20,
                        height: 1.5),
                  ),
                )
            ],

          ),
        ),
      ],),

    ),
  );


  deleteTask(BuildContext context, Task task) {
    final provider =Provider.of<TaskProvider>(context,listen: false);
    provider.removeTask(task);
    Utils.showSnackBar(context,'The Task was deleted');
  }

  editTask(BuildContext context, Task task) => Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => EditTaskPage(task:task),
    ),
  );
  
}
