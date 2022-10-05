import 'package:provider/provider.dart';
import 'package:tick2do/provider/tasks.dart';
import 'package:tick2do/widgets/todo_form_widget.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class EditTaskPage  extends StatefulWidget {
  final Task task;
  const EditTaskPage ({Key? key, required this.task}) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _formKey=GlobalKey<FormState>();
  late String title;
  late String description;
  @override
  void initState() {
    super.initState();
    title=widget.task.title;
    description=widget.task.description;
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Edit Task'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                Provider.of<TaskProvider>(context, listen: false);
                provider.removeTask(widget.task);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: FormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo:saveTask,
            ),
          ),
        ),
      );

  void saveTask() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<TaskProvider>(context, listen: false);

      provider.updateTask(widget.task, title, description);

      Navigator.of(context).pop();
    }
  }

}
