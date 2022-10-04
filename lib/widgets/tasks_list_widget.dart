import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/model/task.dart';
import 'package:tick2do/provider/tasks.dart';

import 'TaskWidget.dart';

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TaskWidget(
      task:Task(cratedTime: DateTime.now(),
          title: 'Studying')
    );
  }
}
