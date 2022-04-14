import 'package:blood_donation/screens/SplashScreen.dart';
import 'package:blood_donation/screens/details_screen.dart';
import 'package:blood_donation/screens/home_layer.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/screens/login_screen.dart';
import 'package:blood_donation/screens/profile_screen.dart';
import 'package:blood_donation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home://HomeLayer(),
      SplashScreen(),
      //LoginScreen(),
      routes: {
        LoginScreen.screenRoute: (context) => LoginScreen(),
        RegisterScreen.screenRoute: (context) => RegisterScreen(),
        HomeScreen.screenRoute: (context) => HomeScreen(),
        HomeLayer.screenRoute: (context) => HomeLayer(),
        DetailsScreen.screenRoute: (context) => DetailsScreen(),





      },
    );
  }
}