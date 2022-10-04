import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tick2do/pages/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Tick2Do';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xFFf6f5ee)),
      home: HomePage(),
    );
  }
}
