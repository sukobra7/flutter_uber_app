import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uber_app/AllScreens/loginScreen.dart';
import 'package:flutter_uber_app/AllScreens/mainscreen.dart';
import 'package:flutter_uber_app/AllScreens/registerationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child('users');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Rider App',
      theme: ThemeData(
        fontFamily: "Signatra",
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.idScreen,
      routes:
      {
        RegisterationScreen.idScreen: (context) =>  RegisterationScreen(),
        LoginScreen.idScreen: (context) =>  LoginScreen(),
        MainScreen.idScreen: (context) =>  MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// 変更確認 のコメント ←後で削除