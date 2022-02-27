import 'package:blood_donation/screens/add_screen.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/screens/profile_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeLayer extends StatefulWidget {
  const HomeLayer({Key? key}) : super(key: key);
  //static const String screenRoute = 'home layer';

  @override
  _HomeLayerState createState() => _HomeLayerState();
}

class _HomeLayerState extends State<HomeLayer> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFd20202),
        title: Center(child: Text(titles[currentIndex])),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFFd20202),
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
    );
  }
}
