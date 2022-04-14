import 'package:blood_donation/screens/add_screen.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/screens/profile_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeLayer extends StatefulWidget {
  static const String screenRoute = 'HomeLayer';
  const HomeLayer({Key? key}) : super(key: key);
  //static const String screenRoute = 'home layer';

  @override
  _HomeLayerState createState() => _HomeLayerState();
}

class _HomeLayerState extends State<HomeLayer> {
  final _auth=FirebaseAuth.instance;
  late User signedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser(){

    try{
      final user=_auth.currentUser;
      if(user!=null){
        signedInUser=user;
        print(signedInUser.email);

      }

    } catch(e){
      print(e);
    }
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    AddScreen(),
    ProfileScreen(),
  ];
  List<String> titles = [
    "Home",
    "Submit blood request",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(
          //backgroundColor: const Color(0xFFd20202),
         // title: Center(child: Text(titles[currentIndex])),
       // ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Color.fromARGB(255, 155, 36, 27),
          style: TabStyle.flip,
          items: const [
            TabItem(
              icon: Icons.home,
              title: "Home",
            ),
            TabItem(
              icon: Icons.add,
              title: "Add",
            ),
            TabItem(
              icon: Icons.person,
              title: "Profile",
            ),
          ],
          initialActiveIndex: 0,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background1.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: screens[currentIndex],
        ),
      ),
    );
  }
}
