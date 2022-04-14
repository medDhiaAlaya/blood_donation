import 'package:blood_donation/widget/my_botton.dart';
import 'package:blood_donation/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_image_slider/carousel.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _firestore = FirebaseFirestore.instance;
  late User signedInUser;
  final _auth =FirebaseAuth.instance;


  List<String> _bloodTypes = ['A', 'B', 'AB', 'O'];
  String? _selectedBlood;
  late String name;
  late String number;
  late String date;
  late String medicalCenter;
  late String note;
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 15,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            //name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value){
                    name=value;
                  },
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 112, 12, 12),
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 112, 12, 12),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: const Color(0xFFd20202),
                    ),
                    labelText: "Enter your name",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 112, 12, 12),
                    ),
                    fillColor: const Color.fromARGB(255, 112, 12, 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 112, 12, 12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 112, 12, 12),
                        width: 2.0,
                      ),
                    ),
                  )),
            ),

            //number
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value){
                    number=value;
                  },
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 112, 12, 12),
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 112, 12, 12),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: const Color(0xFFd20202),
                    ),
                    labelText: "Contact number",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 112, 12, 12),
                    ),
                    fillColor: const Color.fromARGB(255, 112, 12, 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 112, 12, 12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 112, 12, 12),
                        width: 2.0,
                      ),
                    ),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
              child: Container(
                decoration:  BoxDecoration(
                  borderRadius:BorderRadius.circular(25.0) ,
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(255, 112, 12, 12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 3,
                  ),
                  child: DropdownButton(
                    focusColor:Colors.red,
                    isExpanded: true,
                    iconSize: 50,
                    style: const TextStyle(
                        color: const Color(0xFFd20202),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    underline: SizedBox(),
                    borderRadius: BorderRadius.circular(30.0),
                    hint: const Text('Please choose your blood type',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Color.fromARGB(255, 112, 12, 12),
                      ),),
                    // Not necessary for Option 1
                    value: _selectedBlood,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedBlood = newValue as String?;
                      });
                    },
                    items: _bloodTypes.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),


            //medical center

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value){
                    medicalCenter=value;
                  },
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 112, 12, 12),
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 112, 12, 12),
                    prefixIcon: const Icon(
                      Icons.local_hospital,
                      color: const Color(0xFFd20202),
                    ),
                    labelText: "Medical center",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 112, 12, 12),
                    ),
                    fillColor: const Color.fromARGB(255, 112, 12, 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 112, 12, 12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 112, 12, 12),
                        width: 2.0,
                      ),
                    ),
                  )),
            ),



            //date
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value){
                    date=value;
                  },
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 112, 12, 12),
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 112, 12, 12),
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: const Color(0xFFd20202),
                    ),
                    labelText: "Request date",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 112, 12, 12),
                    ),
                    fillColor: const Color.fromARGB(255, 112, 12, 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 112, 12, 12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 112, 12, 12),
                        width: 2.0,
                      ),
                    ),
                  )),
            ),



            //note
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value){
                    note=value;
                  },
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 112, 12, 12),
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 112, 12, 12),
                    prefixIcon: const Icon(
                      Icons.note_add_rounded,
                      color: const Color(0xFFd20202),
                    ),
                    labelText: "Note(optional)",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 112, 12, 12),
                    ),
                    fillColor: const Color.fromARGB(255, 112, 12, 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 112, 12, 12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 112, 12, 12),
                        width: 2.0,
                      ),
                    ),
                  )),
            ),

            const SizedBox(
              height: 20,
            ),
            MyButton(
                color: const Color(0xFFd20202),
                textColor: Colors.white,
                title: "Submit",
                onPressed: () {
                  _firestore.collection("request").add({
                    "name":name,
                    "contact":number,
                    "bloodType":_selectedBlood,
                    "location":medicalCenter,
                    "date":date,
                    "note":note,
                    "sender":signedInUser.email

                  });
                  Navigator.pushNamed(context, "HomeLayer");





                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
