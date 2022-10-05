
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tasks.dart';
import 'TaskWidget.dart';




class CompletedListWidget  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final provider= Provider.of<TaskProvider>(context);
final tasks= provider.completedTasks;
return tasks.isEmpty? Center(
child:Text(

'There is no completed task',
style: TextStyle(
fontSize: 20),
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
