import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/api/firebase_api.dart';
import 'package:tick2do/main.dart';
import 'package:tick2do/model/task.dart';
import 'package:tick2do/provider/tasks.dart';
import 'package:tick2do/widgets/todo_form_widget.dart';
import 'package:tick2do/widgets/add_dialog_widget.dart';

import '../widgets/completed_list_widget.dart';
import '../widgets/tasks_list_widget.dart';
import '../widgets/todo_form_widget.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final user=FirebaseAuth.instance.currentUser;
    final tabs = [
      TasksListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) =>
            setState(() {
              selectedIndex = index;
            }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          )
        ],
      ),
      body: StreamBuilder<List<Task>>(

        stream: FirebaseApi.readTasks(),
        builder: (context,snapshot){


          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              default:
                if(snapshot.hasError){
                  return Text('Something went wrong try later');
                } else{

                  final tasks =snapshot.data;
                  final provider= Provider.of<TaskProvider>(context);
                  provider.setTask(tasks!);
                  return  tabs[selectedIndex];
                }
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () =>
              showDialog(
                context: this.context,
                builder: (BuildContext context) => AddTodoDialogWidget(),

                barrierDismissible: false,

              ),
          child: Icon(Icons.add)
      ),
    );
  }
}

// Padding(padding: EdgeInsets.all(32),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Text('Signed In as', style: TextStyle(fontSize: 16),
// ),
// SizedBox(height: 8),
// Text(
// user!.email!,
// style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// )
// ],
// ),);



