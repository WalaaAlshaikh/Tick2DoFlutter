import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/model/task.dart';
import 'package:tick2do/provider/tasks.dart';

import 'TaskWidget.dart';

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<TaskProvider>(context);
    final tasks= provider.tasks;
    return tasks.isEmpty? Center(
      child:Text(

          'No Tasks here',
          style: TextStyle(
            fontSize: 20,

          ),
      ),
    )
    :ListView.separated(
      separatorBuilder: (context,index)=> Container(height: 8),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
        itemBuilder: (context,index){
          final task =tasks[index];
          return TaskWidget(task: task);
        },
        itemCount: tasks.length
    );

  }
}
