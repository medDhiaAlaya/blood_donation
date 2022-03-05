import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.bloodtype),
                title: Text(
                  'Patient Name',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Text(
                  'Mohamed dhia alaya',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Text(
                  'Tunisia,Gabes',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                autofocus: true,
                onTap: () {
                  //print("button pressed");
                },
                child: Ink(
                  child: Container(
                    color: Color.fromARGB(255, 155, 36, 27),
                    height: 45,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
