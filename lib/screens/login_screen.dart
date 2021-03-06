import 'package:blood_donation/widget/my_botton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'loginScreen';
  const LoginScreen({Key? key}) : super(key: key);


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth =FirebaseAuth.instance;
  var formKey=GlobalKey<FormState>();
  late String email;

  late String password;
  bool isObsecure = true;
  //bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //container is the background
      body: Container(

        //**********************************************wrap with ModalProgressHUD if you want loader
        //********************************************
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(

          key: formKey,
          child: ListView(
            //shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/3.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //login text
              Text(
                "LOGIN",
                style: GoogleFonts.robotoCondensed(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //email text field

              TextFormField(
                validator: (v){
                  if(v!.isEmpty){
                    return'invalide email adress';

                  }
                  return null;
                },

                style: const TextStyle(color: Colors.white),
                onChanged: (v){
                  email=v;
                },

                cursorColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.red,
                    ),
                  ),
                  errorStyle: const TextStyle(color: Colors.white),
                  focusColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                  labelText: "Enter Email",
                  labelStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //password text field

              TextFormField(
                validator: (v){
                  if(v!.isEmpty){
                    return'password incorrecte';

                  }
                  return null;
                },
                style: const TextStyle(color: Colors.white),
                onChanged: (v){
                  password=v;
                },
                cursorColor: Colors.white,
                obscureText: isObsecure,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.red,
                    ),
                  ),
                  errorStyle: const TextStyle(color: Colors.white),
                  focusColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObsecure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isObsecure = !isObsecure;

                      });
                    },
                  ),
                  labelText: "Enter Password",
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                textColor: const Color.fromARGB(255, 112, 12, 12),
                color: Colors.white,
                title: "LOGIN",
                onPressed:()async {
                  setState(() {
                   // showSpinner=true;
                  });
                  try{
                    if(formKey.currentState!.validate()){
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      Navigator.pushNamed(context, "HomeLayer");
                    }

                  }catch(e){
                    print(e);
                  }
                  // print(email);
                   //print(password);
                },
              ),

              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Or connect using: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                        Navigator.pushNamed(context, "registerScreen");

                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
