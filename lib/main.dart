import 'package:blood_donation/screens/edit_profile.dart';
import 'package:blood_donation/screens/home_layer.dart';
import 'package:blood_donation/screens/login_screen.dart';
import 'package:blood_donation/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(),
      home: HomeLayer(),
      routes: {
        LoginScreen.screenRoute: (context) => LoginScreen(),
        RegisterScreen.screenRoute: (context) => RegisterScreen(),
      },
    );
  }
}
