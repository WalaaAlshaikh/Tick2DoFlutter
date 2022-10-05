import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick2do/pages/home_page.dart';
import 'package:tick2do/provider/tasks.dart';
import 'package:tick2do/utils.dart';

import 'authentication/auth_page.dart';
import 'authentication/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navKey=GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


class MyApp extends StatefulWidget {

  static final String title = 'Tick2Do';



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context)
  =>ChangeNotifierProvider(create: (context)=> TaskProvider(),
  child: MaterialApp(
    scaffoldMessengerKey: rootScaffoldMessengerKey,
    navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        title: MyApp.title,
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      scaffoldBackgroundColor: Color(0xFFf6f5ee)
    ),
    home: MainPage(),
  ),
  );


}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState== ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return Center(child: Text('Somthing went wrong'),);
        }
        else if(snapshot.hasData){
          return HomePage();
        }else{
          return AuthPage();
        }

      },
    ),


  );
}


// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   static final String title = 'Tick2Do';
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context)
//   =>ChangeNotifierProvider(create: (context)=> TaskProvider(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: MyApp.title,
//       theme: ThemeData(
//           primarySwatch: Colors.cyan,
//           scaffoldBackgroundColor: Color(0xFFf6f5ee)
//       ),
//       home: HomePage(),
//     ),
//   );
//
//
// }



