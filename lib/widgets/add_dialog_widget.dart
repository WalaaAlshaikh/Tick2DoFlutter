

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/model/task.dart';
import 'package:tick2do/provider/tasks.dart';
import 'package:tick2do/widgets/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
 final _formKey= GlobalKey<FormState>();
 String title= '';
 String description='';

  @override
  Widget build(BuildContext context) =>
    AlertDialog(
      content: Form(
        key: _formKey,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a Task',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 8),
            FormWidget(
              onChangedTitle:(title)=> setState(()=> this.title=title),
              onChangedDescription: (description)=> setState(()=> this.description=description),
              onSavedTodo: addTask,
            ),
          ],
        ),
      )

    );
  void addTask(){
    final isValid=_formKey.currentState?.validate();
    if (!isValid!){
      return;
    }else{
      final task= Task(
          cratedTime: DateTime.now(),
          title: title,
          id:DateTime.now().toString(),
          description: description,
          );
      final provider =Provider.of<TaskProvider>(context,listen: false);
      provider.addTask(task);
      Navigator.of(context).pop();

      
    }

  }
  }




