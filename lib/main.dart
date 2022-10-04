import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/pages/home_page.dart';
import 'package:tick2do/provider/tasks.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Tick2Do';

  @override
  Widget build(BuildContext context)
  =>ChangeNotifierProvider(create: (context)=> TaskProvider(),
  child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      scaffoldBackgroundColor: Colors.white
    ),
    home: HomePage(),
  ),
  );
}
