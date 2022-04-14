import 'package:blood_donation/widget/my_botton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String screenRoute = 'registerScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth=FirebaseAuth.instance;
  final List<String> _bloodTypes = ['A', 'B', 'AB', 'O'];
  String? _selectedBlood;
  late String email;
  late String eu;
  var formKey=GlobalKey<FormState>();
  late String password;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 90,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        //                        color: Color.fromARGB(255, 112, 12, 12),

                        Text(
                      "REGISTER",
                      style: GoogleFonts.robotoCondensed(
                        letterSpacing: 2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFd20202),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (v){
                          if(v!.isEmpty){
                            return'please enter name';

                          }
                          return null;
                        },
                        onChanged: (value){
                          name=value;
                        },
                        obscureText: false,
                        cursorColor: const Color.fromARGB(255, 112, 12, 12),
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.red,
                            ),
                          ),
                          focusColor: const Color.fromARGB(255, 112, 12, 12),
                          prefixIcon: const Icon(
                            Icons.person,
                            color:  Color(0xFFd20202),
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
                  //enter ur email
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (v){
                          if(v!.isEmpty){
                            return'invalide email adress';

                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (v){
                          email=v;
                        },
                        obscureText: false,
                        cursorColor: const Color.fromARGB(255, 112, 12, 12),
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.red,
                            ),
                          ),
                          focusColor: const Color.fromARGB(255, 112, 12, 12),
                          prefixIcon: const Icon(
                            Icons.email,
                            color:  Color(0xFFd20202),
                          ),
                          labelText: "Enter your Email",
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (v){
                          if(v!.isEmpty){
                            return'invalide password';

                          }
                          return null;
                        },
                        onChanged: (v){
                          password=v;
                        },
                        obscureText: true,
                        cursorColor: const Color.fromARGB(255, 112, 12, 12),
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.red,
                            ),
                          ),
                          focusColor: const Color.fromARGB(255, 112, 12, 12),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color:  Color(0xFFd20202),
                          ),
                          labelText: "Enter your Password",
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
                              color: const Color.fromARGB(255, 112, 12, 12),
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
                            color:  Color(0xFFd20202),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                          underline: const SizedBox(),
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
                              child:  Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  MyButton(
                    textColor: Colors.white,
                    color: const Color(0xFFd20202),
                    title: "Register",
                    onPressed: () async {

                      // print(email);
                      // print(password);
                       try{
                             if(formKey.currentState!.validate()){
                              //showSpinner=false;
                               final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                               Navigator.pushNamed(context, "HomeLayer");

                             }


                       } catch(e){
                         eu=e.toString();
                         print(e);

                       }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "You already have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "loginScreen");
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFd20202),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
