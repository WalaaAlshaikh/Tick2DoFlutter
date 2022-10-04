import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tick2do/model/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) => Slidable(

      actionPane: SlidableDrawerActionPane(),
      key: Key(task.id),
      actions: [
        IconSlideAction(
          color: Colors.amber,
          onTap: (){},
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
    child: buildTask(context),
  );

  @override
  Widget buildTask(BuildContext context) =>Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(children: [
      Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: task.isDone,
          onChanged: (_){}
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

  );
  
}
