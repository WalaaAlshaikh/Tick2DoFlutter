import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tick2do/main.dart';
import 'package:tick2do/widgets/add_dialog_widget.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(),
      Container(),
    ];
    int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Compeleted',
          )
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (_)=> AlertDialog(
            content:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a Task',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),

              ],
            ),
          ),

          barrierDismissible: false,

        ),
        child: Icon(Icons.add),),
    );
  }
}
